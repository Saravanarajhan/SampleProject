//
//  NSDictionary+NSDictionary_Key.m
//  Search
//
//  Created by kavindpadi meiyappan on 3/4/17.
//  Copyright © 2017 kavindpadi meiyappan. All rights reserved.
//

#import "NSDictionary+NSDictionary_Key.h"

@implementation NSDictionary (NSDictionary_Key)

- (id)objectExistsForKeyNotNull:(id)key {
    
    id object = [self objectForKey:key];
    if (object == [NSNull null] || !object)
        return @"-NA-";
    return object;
}

@end
