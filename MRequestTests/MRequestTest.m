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
    
    [request requestWithOptions:opts success:^ (NSURLResponse *response, NSData *data) {
        
        NSHTTPURLResponse *httpURLRequest = (NSHTTPURLResponse *)response;
        
        XCTAssertEqual(200, httpURLRequest.statusCode);
        XCTAssertNotNil(data);
        
        [expectation fulfill];
        
        
    }fail:nil];
    
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
    
    [request requestWithOptions:opts success:nil fail:^ (NSURLResponse *response, NSError *err) {
        
        NSHTTPURLResponse *httpURLResponse = (NSHTTPURLResponse *)response;
        
        XCTAssertNotNil(err);
        XCTAssertEqual(0, httpURLResponse.statusCode);
        
        [expectation fulfill];
        
    }];
    
    [self waitForExpectationsWithTimeout:5 handler:^ (NSError *err) {
        
        if (err) {
            XCTFail(@"error: %@", err);
        }
        
    }];
    
}

-(void)testRequestPost {
    
    MRequest *request = [[MRequest alloc]init];
    
    NSDictionary *opts = @{
                           @"method": @"post",
                           @"url": @"http://localhost:8080",
                           @"data": @"something=somethingdata&secondsomething=secondsomethingdata"
                           };
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"should post"];
    
    [request requestWithOptions:opts success:^ (NSURLResponse *response, NSData *data) {
        
        NSHTTPURLResponse *httpURLRequest = (NSHTTPURLResponse *)response;
        
        XCTAssertEqual(200, httpURLRequest.statusCode);
        XCTAssertNotNil(data);
        
        [expectation fulfill];
        
    }fail:nil];
    
    [self waitForExpectationsWithTimeout:0.5 handler:^ (NSError *err) {
       
        if (err) {
            XCTFail(@"error: %@", err);
        }
        
    }];
    
}

-(void)testRequestPostFail {
    
    MRequest *request = [[MRequest alloc]init];
    
    NSDictionary *opts = @{
                           @"method": @"post",
                           @"url": @"http://localhost:8000",
                           @"data": @"something=somethingdata&secondsomething=secondsomethingdata"
                           };
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"should post"];
    
    [request requestWithOptions:opts success:nil fail:^ (NSURLResponse *response, NSError *err) {
        
        NSHTTPURLResponse *httpURLRequest = (NSHTTPURLResponse *)response;
       
        XCTAssertNotNil(err);
        XCTAssertEqual(0, httpURLRequest.statusCode);
        
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
