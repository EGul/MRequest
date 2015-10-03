//
//  MRequest.m
//  MRequest
//
//  Created by sarah on 8/30/15.
//  Copyright (c) 2015 none. All rights reserved.
//

#import "MRequest.h"

@interface MRequest ()

-(void)get:(NSURL *)url success:(void(^)(NSURLResponse *, NSData *))successBlock fail:(void(^)(NSURLResponse *response, NSError *))failBlock;
-(void)post:(NSURL *)url data:(NSString *)data success:(void(^)(NSURLResponse *, NSData *))successBlock fail:(void(^)(NSURLResponse *, NSError *))failBlock;

@end

@implementation MRequest

-(void)requestWithOptions:(NSDictionary *)options success:(void (^)(NSURLResponse *, NSData *))successBlock fail:(void (^)(NSURLResponse *, NSError *))failBlock {

    NSString *method = [options valueForKey:@"method"];
    NSURL *url = [NSURL URLWithString:[options valueForKey:@"url"]];
    
    if ([method isEqualToString:@"get"]) {
        
        [self get:url success:^ (NSURLResponse *response, NSData *data) {
            successBlock(response, data);
        }fail:^ (NSURLResponse *response, NSError *error) {
            failBlock(response, error);
        }];
        
    }
    
    if ([method isEqualToString:@"post"]) {
        
        NSString *data = [options valueForKey:@"data"];
        
        [self post:url data:data success:^ (NSURLResponse *response, NSData *data) {
            successBlock(response, data);
        }fail:^ (NSURLResponse *response, NSError *error) {
            failBlock(response, error);
        }];
        
    }
    
}

-(void)get:(NSURL *)url success:(void (^)(NSURLResponse *, NSData *))successBlock fail:(void (^)(NSURLResponse *response, NSError *))failBlock {

    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]init];
    [request setHTTPMethod:@"get"];
    [request setURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^ (NSURLResponse *response, NSData *data, NSError *error) {
        if (error) {
            failBlock(response, error);
        }
        else {
            successBlock(response, data);
        }
    }];
    
}

-(void)post:(NSURL *)url data:(NSString *)data success:(void (^)(NSURLResponse *, NSData *))successBlock fail:(void (^)(NSURLResponse *, NSError *))failBlock {

    NSData *postData = [data dataUsingEncoding:NSASCIIStringEncoding];
    
    NSString *postLength =[NSString stringWithFormat:@"%lu", postData.length];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]init];
    [request setHTTPMethod:@"post"];
    [request setURL:url];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-type"];
    [request setHTTPBody:postData];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^ (NSURLResponse *response, NSData *data, NSError *error) {
        if (error) {
            failBlock(response, error);
        }
        else {
            successBlock(response, data);
        }
    }];
    
}

@end
