//
//  Podcast.m
//  Search
//
//  Created by kavindpadi meiyappan on 3/2/17.
//  Copyright © 2017 kavindpadi meiyappan. All rights reserved.
//

#import "Podcast.h"
#import "NSDictionary+NSDictionary_Key.h"

@implementation Podcast

-(instancetype)initWithDictonary:(NSDictionary *)dictionary{
    self = [super initWithDictonary:dictionary];
    if (self) {
        self.shortDescription = [dictionary objectExistsForKeyNotNull:@"artistName"];
        self.longDescription = [dictionary objectExistsForKeyNotNull:@"description"];
    }
    return  self;
}

- (instancetype)init {
    return [self initWithDictonary:nil];
}

@end
