//
//  MRequest.m
//  MRequest
//
//  Created by sarah on 8/30/15.
//  Copyright (c) 2015 none. All rights reserved.
//

#import "MRequest.h"

@implementation MRequest

-(void)requestWithOptions:(NSDictionary *)options completionBlock:(void (^)(NSError *, NSHTTPURLResponse *, NSData *))block {
    
    NSError *err = nil;
    NSHTTPURLResponse *response = nil;
    NSData *data = nil;
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]init];
    [request setHTTPMethod:[options valueForKey:@"method"]];
    [request setURL:[NSURL URLWithString:[options valueForKey:@"url"]]];
    
    data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&err];
    
    block(err, response, data);
    
}

@end
