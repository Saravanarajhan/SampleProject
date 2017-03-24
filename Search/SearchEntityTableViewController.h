//
//  SearchEntityTableViewController.h
//  Search
//
//  Created by kavindpadi meiyappan on 3/4/17.
//  Copyright © 2017 kavindpadi meiyappan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SearchEntityDelegate <NSObject>
- (void)updateSearchEntity:(NSString *)entity;
@end

@interface SearchEntityTableViewController : UITableViewController
@property (weak, nonatomic) id<SearchEntityDelegate> delegate;
- (void)clearEntitySelection;
@end
