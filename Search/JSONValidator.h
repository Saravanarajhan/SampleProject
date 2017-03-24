//
//  JSONValidator.h
//  Search
//
//  Created by kavindpadi meiyappan on 3/5/17.
//  Copyright © 2017 kavindpadi meiyappan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSONValidator : NSObject
+ (BOOL)canWeParseResponse:(id)rawResponse;
+ (BOOL)doWeHaveMoreThanZeroResultsForSearchTerm:(NSDictionary *)iResponse;
@end
