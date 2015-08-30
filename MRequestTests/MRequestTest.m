//
//  MRequestTest.m
//  MRequest
//
//  Created by sarah on 8/30/15.
//  Copyright (c) 2015 none. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "MRequest.h"

@interface MRequestTest : XCTestCase

@end

@implementation MRequestTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testRequest {
    
    MRequest *request = [[MRequest alloc]init];
    
    NSDictionary *opts = @{};
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"something"];
    
    [request requestWithOptions:opts completionBlock:^ (NSError *err, NSHTTPURLResponse *response, NSData *data) {
        
        [expectation fulfill];
        
    }];
    
    [self waitForExpectationsWithTimeout:0.5 handler:^ (NSError *err) {
        
        if (err) {
            XCTFail(@"error: %@", err);
        }
        
    }];
    
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
