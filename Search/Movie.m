//
//  Movie.m
//  Search
//
//  Created by kavindpadi meiyappan on 3/2/17.
//  Copyright © 2017 kavindpadi meiyappan. All rights reserved.
//

#import "Movie.h"
#import "NSDictionary+NSDictionary_Key.h"

@implementation Movie


-(instancetype)initWithDictonary:(NSDictionary *)dictionary {
    self = [super initWithDictonary:dictionary];
    if (self) {
    }
    return  self;
}

- (instancetype)init {
    return [self initWithDictonary:nil];
}

@end
