//
//  SearchModelTests.m
//  Search
//
//  Created by kavindpadi meiyappan on 3/5/17.
//  Copyright © 2017 kavindpadi meiyappan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SearchModelHeader.h"

@interface SearchModelTests : XCTestCase
@property (nonatomic, strong) SearchModel *aSearchModelObject;
@property (nonatomic, strong) Movie *aMovieModelObject;
@property (nonatomic, strong) Podcast *aPodcastModelObject;
@property (nonatomic, strong) Song *aSongModelObject;
@property (nonatomic, strong) MusicVideo *aMusicVideoModelObject;
@property (nonatomic, strong) Album *aAlbumModelObject;
@property (nonatomic, strong) TVEpisode *aTVEpisodeModelObject;
@end

@implementation SearchModelTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSearchModelObjectAttribute {
    self.aSearchModelObject = [[SearchModel alloc] initWithDictonary:[self sampleModelDictionary]];
    XCTAssertNotNil(self.aSearchModelObject.trackName);
    XCTAssertNotNil(self.aSearchModelObject.trackPrice);
    XCTAssertNotNil(self.aSearchModelObject.artWorkSmallURL);
    XCTAssertNotNil(self.aSearchModelObject.shortDescription);
    XCTAssertNotNil(self.aSearchModelObject.artWorkLargeURL);
    XCTAssertNotNil(self.aSearchModelObject.longDescription);
    self.aSearchModelObject = nil;
}

- (void)testMovieModelObjectAttribute {
    self.aMovieModelObject = [[Movie alloc] initWithDictonary:[self sampleModelDictionary]];
    XCTAssertNotNil(self.aMovieModelObject.trackName);
    XCTAssertNotNil(self.aMovieModelObject.trackPrice);
    XCTAssertNotNil(self.aMovieModelObject.artWorkSmallURL);
    XCTAssertNotNil(self.aMovieModelObject.shortDescription);
    XCTAssertNotNil(self.aMovieModelObject.artWorkLargeURL);
    XCTAssertNotNil(self.aMovieModelObject.longDescription);
    self.aMovieModelObject = nil;
}

- (void)testPodcastModelObjectAttribute {
    self.aPodcastModelObject = [[Podcast alloc] initWithDictonary:[self sampleModelDictionary]];
    XCTAssertNotNil(self.aPodcastModelObject.trackName);
    XCTAssertNotNil(self.aPodcastModelObject.trackPrice);
    XCTAssertNotNil(self.aPodcastModelObject.artWorkSmallURL);
    XCTAssertNotNil(self.aPodcastModelObject.shortDescription);
    XCTAssertNotNil(self.aPodcastModelObject.artWorkLargeURL);
    XCTAssertNotNil(self.aPodcastModelObject.longDescription);
    self.aPodcastModelObject = nil;
}

- (void)testSongModelObjectAttribute {
    self.aSongModelObject = [[Song alloc] initWithDictonary:[self sampleModelDictionary]];
    XCTAssertNotNil(self.aSongModelObject.trackName);
    XCTAssertNotNil(self.aSongModelObject.trackPrice);
    XCTAssertNotNil(self.aSongModelObject.artWorkSmallURL);
    XCTAssertNotNil(self.aSongModelObject.shortDescription);
    XCTAssertNotNil(self.aSongModelObject.artWorkLargeURL);
    XCTAssertNotNil(self.aSongModelObject.longDescription);
    self.aSongModelObject = nil;
}

- (void)testMusicVideoModelObjectAttribute {
    self.aMusicVideoModelObject = [[MusicVideo alloc] initWithDictonary:[self sampleModelDictionary]];
    XCTAssertNotNil(self.aMusicVideoModelObject.trackName);
    XCTAssertNotNil(self.aMusicVideoModelObject.trackPrice);
    XCTAssertNotNil(self.aMusicVideoModelObject.artWorkSmallURL);
    XCTAssertNotNil(self.aMusicVideoModelObject.shortDescription);
    XCTAssertNotNil(self.aMusicVideoModelObject.artWorkLargeURL);
    XCTAssertNotNil(self.aMusicVideoModelObject.longDescription);
    self.aMusicVideoModelObject = nil;
}
- (void)testAlbumModelObjectAttribute {
    self.aAlbumModelObject = [[Album alloc] initWithDictonary:[self sampleModelDictionary]];
    XCTAssertNotNil(self.aAlbumModelObject.trackName);
    XCTAssertNotNil(self.aAlbumModelObject.trackPrice);
    XCTAssertNotNil(self.aAlbumModelObject.artWorkSmallURL);
    XCTAssertNotNil(self.aAlbumModelObject.shortDescription);
    XCTAssertNotNil(self.aAlbumModelObject.artWorkLargeURL);
    XCTAssertNotNil(self.aAlbumModelObject.longDescription);
    self.aAlbumModelObject = nil;
}

- (void)testTVEpisodeModelObjectAttribute {
    self.aTVEpisodeModelObject = [[TVEpisode alloc] initWithDictonary:[self sampleModelDictionary]];
    XCTAssertNotNil(self.aTVEpisodeModelObject.trackName);
    XCTAssertNotNil(self.aTVEpisodeModelObject.trackPrice);
    XCTAssertNotNil(self.aTVEpisodeModelObject.artWorkSmallURL);
    XCTAssertNotNil(self.aTVEpisodeModelObject.shortDescription);
    XCTAssertNotNil(self.aTVEpisodeModelObject.artWorkLargeURL);
    XCTAssertNotNil(self.aTVEpisodeModelObject.longDescription);
    self.aTVEpisodeModelObject = nil;
}


- (NSDictionary *)sampleModelDictionary {
    
    NSDictionary *modelDictionary = nil;
    modelDictionary = @{
                        @"artistName" : @"Friends",
                        @"artistViewUrl" : @"https://itunes.apple.com/us/tv-show/friends/id166638839?uo=4",
                        @"artworkUrl100" : @"http://is1.mzstatic.com/image/thumb/Music69/v4/9b/58/b6/9b58b6d6-d62b-9ff5-5995-95c88483105c/source/100x100bb.jpg",
                        @"artworkUrl60" : @"http://is1.mzstatic.com/image/thumb/Music69/v4/9b/58/b6/9b58b6d6-d62b-9ff5-5995-95c88483105c/source/30x30bb.jpg",
                        @"artworkUrl60" : @"http://is1.mzstatic.com/image/thumb/Music69/v4/9b/58/b6/9b58b6d6-d62b-9ff5-5995-95c88483105c/source/60x60bb.jpg",
                        @"collectionName" : @"Friends, Season 3",
                        @"collectionPrice" : @"19.99",
                        @"collectionViewUrl" : @"https://itunes.apple.com/us/tv-season/the-one-at-the-beach/id203755780?i=205129576&uo=4",
                        @"longDescription" : @"The gang goes to the beach. Phoebe meets a family friend with links to her family's past. Ross discovers that Rachel still loves him.",
                        @"shortDescription" : @"The gang goes to the beach. Phoebe meets a family friend with links to her family's past. Ross discovers that Rachel still loves him.",
                        @"description" : @"Friends",
                        @"trackName" : @"The One At the Beach",
                        @"trackPrice" : @"1.99"
                        };
    
    return modelDictionary;
}

@end
