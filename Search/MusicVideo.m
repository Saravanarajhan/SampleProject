//
//  MusicVideo.m
//  Search
//
//  Created by kavindpadi meiyappan on 3/2/17.
//  Copyright © 2017 kavindpadi meiyappan. All rights reserved.
//

#import "MusicVideo.h"
#import "NSDictionary+NSDictionary_Key.h"

@interface MusicVideo()
@property (nonatomic, copy, readwrite) NSString* artistName;
@property (nonatomic, copy, readwrite) NSString* collectionName;
@end

@implementation MusicVideo

-(instancetype)initWithDictonary:(NSDictionary *)dictionary{
    self = [super initWithDictonary:dictionary];
    if (self) {
        _artistName = [dictionary objectExistsForKeyNotNull:@"artistName"];
        _collectionName =  [dictionary objectExistsForKeyNotNull:@"collectionName"];
        self.shortDescription = [NSString stringWithFormat:@"%@ %@", _artistName, _collectionName];
        self.longDescription = [dictionary objectExistsForKeyNotNull:@"description"];
    }
    return  self;
}

- (instancetype)init {
    return [self initWithDictonary:nil];
}

@end
