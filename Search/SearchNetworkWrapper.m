//
//  SearchNetworkWrapper.m
//  Search
//
//  Created by kavindpadi meiyappan on 3/4/17.
//  Copyright © 2017 kavindpadi meiyappan. All rights reserved.
//

#import "SearchNetworkWrapper.h"
#import "AFNetworking.h"
#import "SearchModelHeader.h"
#import "JSONValidator.h"

NSString* const SearchResultsResponseValidationErrorDomain = @"SearchResultsInValidResponse";

@interface SearchNetworkWrapper()
@property (nonatomic, strong, readwrite) NSMutableArray *searchResults;
@property (nonatomic, strong) NSDictionary *modelClasses;
@property (nonatomic, copy) NSString *entityAttribute;
@end

@implementation SearchNetworkWrapper

- (NSMutableArray *)searchResults {
    if (!_searchResults) {
        _searchResults = [[NSMutableArray alloc] init];
    }
    return _searchResults;
}

- (NSDictionary *)modelClasses {
    if(!_modelClasses) {
        _modelClasses = @{@"movie" : @"Movie", @"podcast" : @"Podcast", @"song" : @"Song",  @"musicVideo" : @"MusicVideo", @"tvEpisode" : @"TVEpisode", @"album" : @"Album"};
    }
    return _modelClasses;
}

- (void)performSearchFor:(NSString *)searchTerm forTheEntity:(NSString *)searchEntity withCompletion:(void (^)(BOOL isSuccess, NSArray *searchResults, NSError *errorObject))completion{
    self.entityAttribute = searchEntity;
    [self.searchResults removeAllObjects];
    
    __weak SearchNetworkWrapper *weakSelf = self;
    
    NSString *completeURLString = [NSString stringWithFormat:@"https://itunes.apple.com/search?term=%@&entity=%@", searchTerm, searchEntity];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:completeURLString parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {

        //clear local data first before adding them
       [self.searchResults removeAllObjects];
 
       BOOL isValidResponse =  [JSONValidator canWeParseResponse:responseObject];
        
        if (isValidResponse) {
            
            if([JSONValidator doWeHaveMoreThanZeroResultsForSearchTerm:responseObject]) {
                NSDictionary *response = (NSDictionary *)responseObject;
                NSArray *result = [weakSelf parseResponseToModelObject:response];
            
                if (completion != nil) {
                    completion (YES, result, nil);
                }
            } else {
                //Zero Results
                NSDictionary *errorUserInfo = @{
                                                NSLocalizedDescriptionKey: NSLocalizedString(@"There are no results matching search criteria", nil),
                                                NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"The were Zero Results", nil)
                                                };
                NSError *error = nil;
                error = [[NSError alloc] initWithDomain:SearchResultsResponseValidationErrorDomain code:-91 userInfo:errorUserInfo];
                
                if (completion != nil) {
                    completion (NO, nil, error);
                }
            }
        } else {
            NSDictionary *errorUserInfo = @{
                                       NSLocalizedDescriptionKey: NSLocalizedString(@"There was problem with the response.Please try again later.", nil),
                                       NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"The Response was Invalid.", nil)
                                       };
            NSError *error = nil;
            error = [[NSError alloc] initWithDomain:SearchResultsResponseValidationErrorDomain code:-90 userInfo:errorUserInfo];
            
            if (completion != nil) {
                completion (NO, nil, error);
            }
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (completion != nil) {
            completion (NO, nil, error);
        }
    }];
}

- (NSArray *)parseResponseToModelObject:(NSDictionary *)responseObject {
    NSArray *resultsArray = [responseObject valueForKey:@"results"];
    
    __weak SearchNetworkWrapper *weakSelf = self;
    Class myCLass = NSClassFromString(self.modelClasses[self.entityAttribute]);
    
    [resultsArray enumerateObjectsUsingBlock:^(NSDictionary * dictionary, NSUInteger idx, BOOL * _Nonnull stop) {
        id modelObject = [[myCLass alloc] initWithDictonary:dictionary];
        [weakSelf.searchResults addObject:modelObject];
    }];
    return [weakSelf.searchResults copy];
}


@end
