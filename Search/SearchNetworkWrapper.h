//
//  SearchNetworkWrapper.h
//  Search
//
//  Created by kavindpadi meiyappan on 3/4/17.
//  Copyright © 2017 kavindpadi meiyappan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchNetworkWrapper : NSObject
@property (nonatomic, strong, readonly) NSMutableArray *searchResults;
- (void)performSearchFor:(NSString *)searchTerm forTheEntity:(NSString *)searchEntity withCompletion:(void (^) (BOOL isSuccess, NSArray *searchResults, NSError *errorObject))completion;
@end
