//
//  SearchEntityTVCTests.m
//  Search
//
//  Created by kavindpadi meiyappan on 3/5/17.
//  Copyright © 2017 kavindpadi meiyappan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "SearchEntityTableViewController.h"

@interface SearchEntityTVCTests : XCTestCase
@property (nonatomic, strong) SearchEntityTableViewController *aSearchEntityTC;
@end

@interface SearchEntityTableViewController()
@property (nonatomic, strong) NSArray *entityList;
@property (nonatomic, strong) NSIndexPath *selectedIndexpath;
@end

@implementation SearchEntityTVCTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.aSearchEntityTC = [[SearchEntityTableViewController alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    self.aSearchEntityTC = nil;
    [super tearDown];
}

-(void)testClearEntityMethod {
    self.aSearchEntityTC.selectedIndexpath = [NSIndexPath indexPathForRow:0 inSection:1];
    [self.aSearchEntityTC clearEntitySelection];
    XCTAssertNil(self.aSearchEntityTC.selectedIndexpath);
}

-(void)testEntityArray {
    NSArray *temp = self.aSearchEntityTC.entityList;
    XCTAssertNotNil(temp);
}

@end
