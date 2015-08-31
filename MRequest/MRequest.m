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
-(void)post:(NSURL *)url data:(NSString *)data completionHandler:(void(^)(NSError *, NSURLResponse *, NSData *))block;

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
    
    if ([method isEqualToString:@"post"]) {
        
        NSString *data = [options valueForKey:@"data"];
        
        [self post:url data:data completionHandler:^ (NSError *error, NSURLResponse *response, NSData *data) {
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

-(void)post:(NSURL *)url data:(NSString *)data completionHandler:(void (^)(NSError *, NSURLResponse *, NSData *))block {
    
    NSData *postData = [data dataUsingEncoding:NSASCIIStringEncoding];
    
    NSString *postLength =[NSString stringWithFormat:@"%lu", postData.length];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]init];
    [request setHTTPMethod:@"post"];
    [request setURL:url];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-type"];
    [request setHTTPBody:postData];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^ (NSURLResponse *response, NSData *data, NSError *error) {
        block(error, response, data);
    }];
    
}

@end
