//
//  MRequest.m
//  MRequest
//
//  Created by sarah on 8/30/15.
//  Copyright (c) 2015 none. All rights reserved.
//

#import "MRequest.h"

@implementation MRequest

-(void)requestWithOptions:(NSDictionary *)options completionBlock:(void (^)(NSError *, NSURLResponse *, NSData *))block {
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]init];
    [request setHTTPMethod:[options valueForKey:@"method"]];
    [request setURL:[NSURL URLWithString:[options valueForKey:@"url"]]];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^ (NSURLResponse *response, NSData *data, NSError *error) {
        block(error, response, data);
    }];
    
}

@end
