//
//  SearchModel.m
//  Search
//
//  Created by kavindpadi meiyappan on 3/4/17.
//  Copyright © 2017 kavindpadi meiyappan. All rights reserved.
//

#import "SearchModel.h"
#import "NSDictionary+NSDictionary_Key.h"


@implementation SearchModel

-(instancetype)initWithDictonary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _trackName = [dictionary objectExistsForKeyNotNull:@"trackName"];
        _trackPrice = [dictionary objectExistsForKeyNotNull:@"trackPrice"];
        _artWorkSmallURL = [dictionary objectExistsForKeyNotNull:@"artworkUrl60"];
        _artWorkLargeURL = [dictionary objectExistsForKeyNotNull:@"artworkUrl100"];
        _shortDescription = [dictionary objectExistsForKeyNotNull:@"shortDescription"];
        _longDescription = [dictionary objectExistsForKeyNotNull:@"longDescription"];
    }
    return  self;
}

- (instancetype)init {
    return [self initWithDictonary:nil];
}

@end
