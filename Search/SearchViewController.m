//
//  SearchViewController.m
//  Search
//
//  Created by kavindpadi meiyappan on 3/2/17.
//  Copyright © 2017 kavindpadi meiyappan. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchTableViewCell.h"
#import "DetailViewController.h"
#import "SearchNetworkWrapper.h"
#import "UIImageView+AFNetworking.h"
#import "SearchEntityTableViewController.h"
#import "SearchModelHeader.h"

@interface SearchViewController ()<UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, SearchEntityDelegate>
@property (nonatomic, strong) SearchNetworkWrapper *searchNetworkWrapper;
@property (nonatomic, strong) NSMutableArray *searchResultsArray;
@property (nonatomic, strong) SearchEntityTableViewController *aSearchEntityTableVCObject;
@property (nonatomic, copy) NSString *searchTermText;
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicatorView;
@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.searchTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.title = @"Search";
    self.musicSearchBar.placeholder = @"Search for Music, Video etc.,";
    
    self.navigationItem.rightBarButtonItem =
     [[UIBarButtonItem alloc] initWithTitle:@"Filter" style:UIBarButtonItemStylePlain target:self action:@selector(filterEntity:)];
    self.navigationItem.leftBarButtonItem =
    [[UIBarButtonItem alloc] initWithTitle:@"Clear Filter" style:UIBarButtonItemStylePlain target:self action:@selector(clearfilterEntity:)];
    self.navigationItem.leftBarButtonItem.enabled = NO;
}

- (void)filterEntity:(UIBarButtonItem *)barButtonItem {
    self.navigationItem.leftBarButtonItem.enabled = YES;
    self.aSearchEntityTableVCObject.modalPresentationStyle = UIModalPresentationFormSheet;
    UINavigationController *navCon = [[UINavigationController alloc] initWithRootViewController:self.aSearchEntityTableVCObject];
    [self.navigationController presentViewController:navCon animated:YES completion:nil];
}

- (void)clearfilterEntity:(UIBarButtonItem *)barButtonItem {
    self.navigationItem.leftBarButtonItem.enabled = NO;
    self.navigationItem.rightBarButtonItem.title = @"Filter";
    [self.aSearchEntityTableVCObject clearEntitySelection];
    
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self dismissKeyboard];
    
    if (self.musicSearchBar.text.length == 0)
        return;
    
    self.searchTermText = searchBar.text;

    [self searchItuneWithSearchTerm:self.searchTermText withOptionalEntity:self.navigationItem.rightBarButtonItem.title];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [self dismissKeyboard];
    [self removeLocalSearchData];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if ([searchText length] == 0) {
        self.searchTermText = @"";
        [self dismissKeyboard];
        [self removeLocalSearchData];
    }
    self.searchTermText = searchText;
}

- (void)searchItuneWithSearchTerm:(NSString *)searchTerm withOptionalEntity:(NSString *)entity {
    [self removeLocalSearchData];

    NSString *entityAttribute = nil;
    
    if ([entity isEqualToString:@"Filter"]) {
        entityAttribute = @"song";
    } else {
        entityAttribute = entity;
    }
    
    self.searchTermText  = searchTerm;
    
    NSString *searchTermForURL = self.searchTermText;
    
    if (searchTermForURL != nil) {
        searchTermForURL = [searchTermForURL stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    }
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [self.activityIndicatorView startAnimating];
    
    __weak SearchViewController *weakSelf = self;
    
    [self.searchNetworkWrapper performSearchFor:searchTermForURL forTheEntity:entityAttribute withCompletion:^(BOOL isSuccess, NSArray *searchResults, NSError *errorObject) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
            [weakSelf.activityIndicatorView stopAnimating];

        });
        
        if (isSuccess) {
            [weakSelf.searchResultsArray addObjectsFromArray:searchResults];
            [weakSelf reloadTableView];
            
        } else {
            [weakSelf showErrorAlert:errorObject];
        }
    }];
}

- (void) showErrorAlert:(NSError *)error {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error"
                                                                             message:[error localizedDescription]
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"Ok"
                                                        style:UIAlertActionStyleCancel
                                                      handler:^(UIAlertAction *action){
                                                          UIViewController* rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
                                                          
                                                          if (rootViewController == alertController) {
                                                              [rootViewController dismissViewControllerAnimated:YES completion:nil];
                                                          }
                                                      }]];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)dismissKeyboard {
    
    [self.musicSearchBar resignFirstResponder];
}

- (SearchNetworkWrapper *)searchNetworkWrapper {
    if (!_searchNetworkWrapper) {
        _searchNetworkWrapper = [[SearchNetworkWrapper alloc] init];
    }
    return _searchNetworkWrapper;
}

- (NSMutableArray *)searchResultsArray {
    if (!_searchResultsArray) {
        _searchResultsArray = [[NSMutableArray alloc] init];
    }
    return _searchResultsArray;
}

- (SearchEntityTableViewController *)aSearchEntityTableVCObject {
    if (!_aSearchEntityTableVCObject) {
        _aSearchEntityTableVCObject = [self.storyboard instantiateViewControllerWithIdentifier:@"searchEntity"];
        _aSearchEntityTableVCObject.delegate = self;
    }
    return _aSearchEntityTableVCObject;
}

- (UIActivityIndicatorView *)activityIndicatorView {
    if (!_activityIndicatorView) {
        _activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _activityIndicatorView.frame = CGRectMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2, 50, 50);
        [self.view addSubview:_activityIndicatorView];
        [self.view bringSubviewToFront:_activityIndicatorView];
    }
    return _activityIndicatorView;
}

- (void)reloadTableView {
    __weak SearchViewController *weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        [weakSelf.searchTableView reloadData];
    });
}

- (void)removeLocalSearchData {
    [self reloadTableView];
    [self.searchResultsArray removeAllObjects];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.searchResultsArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"SearchTrackCell";
    
    SearchTableViewCell *cell;
    if (cell == nil) {
        cell = [tableView  dequeueReusableCellWithIdentifier:cellIdentifier];
    }
    SearchModel *aSearchModelObject = self.searchResultsArray[indexPath.row];
    cell.cellTitle.text = aSearchModelObject.trackName;
    cell.cellSubTitle.text = aSearchModelObject.shortDescription;
    cell.itemPrice.text = [NSString stringWithFormat:@"$%@",aSearchModelObject.trackPrice];
    
    NSURL *url = [NSURL URLWithString:aSearchModelObject.artWorkSmallURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    UIImage *placeholderImage = [UIImage imageNamed:@"placeholder"];

    __weak SearchTableViewCell *weakCell = cell;
	[cell.trackImageView setImageWithURLRequest:request placeholderImage:placeholderImage success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {

        weakCell.trackImageView.image = image;
        [weakCell setNeedsLayout];

    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
        //set default image
        weakCell.trackImageView.image = placeholderImage;
        [weakCell setNeedsLayout];
    }];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DetailViewController *aDetailVCObject = [self.storyboard instantiateViewControllerWithIdentifier:@"detailViewController"];
    aDetailVCObject.searchModelData = (SearchModel *)self.searchResultsArray[indexPath.row];
    [self.navigationController pushViewController:aDetailVCObject animated:YES];
}

- (void)updateSearchEntity:(NSString *)entity {
    self.navigationItem.rightBarButtonItem.title = entity;
    
    if (self.searchTermText.length > 0) {
        [self searchItuneWithSearchTerm:self.searchTermText withOptionalEntity:entity];
    }
}

@end
