//
//  JSONHelperTests.m
//  Search
//
//  Created by kavindpadi meiyappan on 3/5/17.
//  Copyright © 2017 kavindpadi meiyappan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "JSONValidator.h"

@interface JSONHelperTests : XCTestCase

@end

@implementation JSONHelperTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testJSONWithZeroValues {
    XCTAssertTrue([JSONValidator canWeParseResponse:[self sampleZeroDictionaryResponse]]);
    XCTAssertFalse([JSONValidator doWeHaveMoreThanZeroResultsForSearchTerm:[self sampleZeroDictionaryResponse]]);
}

- (void)testInvalidJSON {
    XCTAssertTrue([JSONValidator canWeParseResponse:[self sampleInvalidDictionaryResponse]]);
    XCTAssertFalse([JSONValidator doWeHaveMoreThanZeroResultsForSearchTerm:[self sampleZeroDictionaryResponse]]);
}

- (void)testNilJSON {
    XCTAssertFalse([JSONValidator canWeParseResponse:nil]);
    XCTAssertFalse([JSONValidator doWeHaveMoreThanZeroResultsForSearchTerm:nil]);
}

- (void)testEmptyJSON {
	XCTAssertFalse([JSONValidator canWeParseResponse:[self sampleEmptyDictionaryResponse]]);
    XCTAssertFalse([JSONValidator doWeHaveMoreThanZeroResultsForSearchTerm:[self sampleEmptyDictionaryResponse]]);
}

- (NSDictionary *)sampleEmptyDictionaryResponse {
    NSDictionary *returnVal = nil;
    returnVal = @{};
    return returnVal;
}

- (NSDictionary *)sampleInvalidDictionaryResponse {
    NSDictionary *returnVal = nil;
    returnVal = @{@"ked" : @(0),
                  @"abc" : @[]};
    return returnVal;
}

- (NSDictionary *)sampleZeroDictionaryResponse {
    NSDictionary *returnVal = nil;
    returnVal = @{@"resultCount" : @(0),
                  @"results" : @[]};
    return returnVal;
}

@end
