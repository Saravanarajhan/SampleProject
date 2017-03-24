//
//  SearchDictionaryHelperTests.m
//  Search
//
//  Created by kavindpadi meiyappan on 3/5/17.
//  Copyright © 2017 kavindpadi meiyappan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSDictionary+NSDictionary_Key.h"

@interface SearchDictionaryHelperTests : XCTestCase

@end

@implementation SearchDictionaryHelperTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDictionaryWithKey {
    NSDictionary *tempDictionary = @{@"Key1" : @"Value1", @"Key2" : @"Value2"};
    NSString *value = [tempDictionary objectExistsForKeyNotNull:@"Key1"];
    XCTAssertTrue([value isEqualToString:@"Value1"]);
}

- (void)testDictionaryWithNoKey {
    NSDictionary *tempDictionary = @{@"Key1" : @"Value1", @"Key2" : @"Value2"};
    NSString *value = [tempDictionary objectExistsForKeyNotNull:@"Blah"];
    XCTAssertNotNil(value);
    XCTAssertTrue([value isEqualToString:@"-NA-"]);
}


@end
