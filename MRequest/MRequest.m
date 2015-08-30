//
//  MRequest.m
//  MRequest
//
//  Created by sarah on 8/30/15.
//  Copyright (c) 2015 none. All rights reserved.
//

#import "MRequest.h"

@interface MRequest ()

-(void)get:(NSURL *)url completionHandler:(void(^)(NSError *, NSURLResponse *, NSData *))block;

@end

@implementation MRequest

-(void)requestWithOptions:(NSDictionary *)options completionHandler:(void (^)(NSError *, NSURLResponse *, NSData *))block {
    
    NSString *method = [options valueForKey:@"method"];
    NSURL *url = [NSURL URLWithString:[options valueForKey:@"url"]];
    
    if ([method isEqualToString:@"get"]) {
        
        [self get:url completionHandler:^ (NSError *error, NSURLResponse *response, NSData *data) {
            block(error, response, data);
        }];
        
    }
    
}

-(void)get:(NSURL *)url completionHandler:(void (^)(NSError *, NSURLResponse *, NSData *))block {
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]init];
    [request setHTTPMethod:@"get"];
    [request setURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^ (NSURLResponse *response, NSData *data, NSError *error) {
        block(error, response, data);
    }];
    
}

@end
