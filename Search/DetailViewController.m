//
//  DetailViewController.m
//  Search
//
//  Created by kavindpadi meiyappan on 3/2/17.
//  Copyright © 2017 kavindpadi meiyappan. All rights reserved.
//

#import "DetailViewController.h"
#import "SearchModel.h"
#import "UIImageView+AFNetworking.h"
#import "SearchModelHeader.h"

@interface DetailViewController ()
@property (strong, nonatomic) IBOutlet UILabel *trackDescription;
@property (strong, nonatomic) IBOutlet UIImageView *trackImageView;
@property (strong, nonatomic) IBOutlet UILabel *trackTitle;
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Search Details";
    [self setUpView];
}

- (void)setUpView {
    self.trackTitle.text = self.searchModelData.trackName;
    self.trackDescription.text = self.searchModelData.longDescription;
    [self loadImageView];
}

- (void)loadImageView {
    __weak DetailViewController *weakSelf = self;
    
    NSURL *url = [NSURL URLWithString:self.searchModelData.artWorkLargeURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    UIImage *placeholderImage = [UIImage imageNamed:@"placeholder"];
    [self.trackImageView setImageWithURLRequest:request placeholderImage:placeholderImage success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
        
        weakSelf.trackImageView.image = image;
        [weakSelf.trackImageView setNeedsLayout];
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
        //set default image
        weakSelf.trackImageView.image = placeholderImage;
        [weakSelf.trackImageView setNeedsLayout];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
