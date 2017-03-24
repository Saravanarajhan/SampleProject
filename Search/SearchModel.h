//
//  SearchModel.h
//  Search
//
//  Created by kavindpadi meiyappan on 3/4/17.
//  Copyright © 2017 kavindpadi meiyappan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchModel : NSObject
@property (nonatomic, copy) NSString* trackName; //title
@property (nonatomic, copy) NSString* trackPrice; //price
@property (nonatomic, copy) NSString* artWorkSmallURL; //30x30 url
@property (nonatomic, copy) NSString* shortDescription; //subtitle
@property (nonatomic, copy) NSString* artWorkLargeURL; //100x100 url
@property (nonatomic, copy) NSString* longDescription; //Description

-(instancetype)initWithDictonary:(NSDictionary *)dictionary  NS_DESIGNATED_INITIALIZER;
@end
