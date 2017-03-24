//
//  TVEpisode.m
//  Search
//
//  Created by kavindpadi meiyappan on 3/2/17.
//  Copyright © 2017 kavindpadi meiyappan. All rights reserved.
//

#import "TVEpisode.h"
#import "NSDictionary+NSDictionary_Key.h"

@implementation TVEpisode

-(instancetype)initWithDictonary:(NSDictionary *)dictionary{
    self = [super initWithDictonary:dictionary];
    if (self) {
    }
    return  self;
}

- (instancetype)init {
    return [self initWithDictonary:nil];
}


@end
