//
//  Album.m
//  Search
//
//  Created by kavindpadi meiyappan on 3/2/17.
//  Copyright © 2017 kavindpadi meiyappan. All rights reserved.
//

#import "Album.h"
#import "NSDictionary+NSDictionary_Key.h"

@implementation Album

-(instancetype)initWithDictonary:(NSDictionary *)dictionary{
    self = [super initWithDictonary:dictionary];
    if (self) {
        self.trackName =  [dictionary objectExistsForKeyNotNull:@"collectionName"];
        self.trackPrice =  [dictionary objectExistsForKeyNotNull:@"collectionPrice"];
        self.shortDescription =  [dictionary objectExistsForKeyNotNull:@"artistName"];
        self.longDescription =  [dictionary objectExistsForKeyNotNull:@"description"];
    }
    return  self;
}

- (instancetype)init {
    return [self initWithDictonary:nil];
}

@end
