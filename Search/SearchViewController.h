//
//  SearchViewController.h
//  Search
//
//  Created by kavindpadi meiyappan on 3/2/17.
//  Copyright © 2017 kavindpadi meiyappan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SearchEntityTableViewController;
@interface SearchViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITableView *searchTableView;
@property (strong, nonatomic) IBOutlet UISearchBar *musicSearchBar;
@end

