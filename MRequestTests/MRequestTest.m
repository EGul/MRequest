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

-(void)testRequestGet {
    
    MRequest *request = [[MRequest alloc]init];

    NSDictionary *opts = @{
                           @"method": @"get",
                           @"url": @"http://localhost:8080"
                           };
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"should get"];
    
    [request requestWithOptions:opts completionHandler:^ (NSError *err, NSURLResponse *response, NSData *data) {
        
        [expectation fulfill];
        
        NSHTTPURLResponse *httpURLResponse = (NSHTTPURLResponse *)response;
        
        XCTAssertNil(err);
        XCTAssertEqual(200, httpURLResponse.statusCode);
        XCTAssertNotNil(data);
        
    }];
    
    [self waitForExpectationsWithTimeout:0.5 handler:^ (NSError *err) {
        
        if (err) {
            XCTFail(@"error: %@", err);
        }
        
    }];
    
}

-(void)testRequestGetFail {
    
    MRequest *request = [[MRequest alloc]init];
    
    NSDictionary *opts = @{
                           @"method": @"get",
                           @"url": @"https://localhost:8000"
                           };
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"should not get"];
    
    [request requestWithOptions:opts completionHandler:^ (NSError *err, NSURLResponse *response, NSData *data) {
        
        NSHTTPURLResponse *httpURLResponse = (NSHTTPURLResponse *)response;
        
        [expectation fulfill];
        
        XCTAssertNotNil(err);
        XCTAssertEqual(0, httpURLResponse.statusCode);
        XCTAssertNil(data);
        
    }];
    
    [self waitForExpectationsWithTimeout:5 handler:^ (NSError *err) {
        
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
