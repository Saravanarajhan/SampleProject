//
//  JSONValidator.m
//  Search
//
//  Created by kavindpadi meiyappan on 3/5/17.
//  Copyright © 2017 kavindpadi meiyappan. All rights reserved.
//

#import "JSONValidator.h"

@implementation JSONValidator

+ (BOOL)canWeParseResponse:(id)rawResponse {
    if (rawResponse == nil)
        return NO;
    
    BOOL isResponseParsable = NO;
    
    assert([rawResponse isKindOfClass:[NSDictionary class]]);
    
    if ([rawResponse isKindOfClass:[NSDictionary class]]) {
        NSDictionary *rawDictionary = (NSDictionary *)rawResponse;
        if (rawDictionary.count > 0) {
            isResponseParsable = YES;
        }
    }
    return isResponseParsable;
}

+ (BOOL)doWeHaveMoreThanZeroResultsForSearchTerm:(NSDictionary *)iResponse {
    BOOL doWeHaveResults = NO;
    
    NSNumber *resultsCount = [iResponse valueForKey:@"resultCount"];
    
    if ([resultsCount integerValue] > 0) {
        
        id resultsList = [iResponse valueForKey:@"results"];
        
        if ([resultsList isKindOfClass:[NSArray class]]) {
            doWeHaveResults = YES;
        }
    }
    return doWeHaveResults;
}


@end
