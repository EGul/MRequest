//
//  MRequest.m
//  MRequest
//
//  Created by sarah on 8/30/15.
//  Copyright (c) 2015 none. All rights reserved.
//

#import "MRequest.h"

@implementation MRequest

-(void)requestWithOptions:(NSDictionary *)options completionBlock:(void (^)(NSError *, NSHTTPURLResponse *response, NSData *))block {
    
    NSError *err;
    NSHTTPURLResponse *response;
    NSData *data;
    
    block(err, response, data);
    
}

@end
