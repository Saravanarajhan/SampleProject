//
//  SearchTableViewCell.h
//  Search
//
//  Created by kavindpadi meiyappan on 3/2/17.
//  Copyright © 2017 kavindpadi meiyappan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchTableViewCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel *cellTitle;
@property (nonatomic, weak) IBOutlet UILabel *cellSubTitle;
@property (nonatomic, weak) IBOutlet UILabel *itemPrice;
@property (nonatomic, weak) IBOutlet UIImageView *trackImageView;
@end
