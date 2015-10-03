//
//  MRequest.h
//  MRequest
//
//  Created by sarah on 8/30/15.
//  Copyright (c) 2015 none. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MRequest : NSObject {
    
}

//-(void)requestWithOptions:(NSDictionary *)options completionHandler:(void(^)(NSError *, NSURLResponse *, NSData *))block;
-(void)requestWithOptions:(NSDictionary *)options success:(void(^)(NSURLResponse *, NSData *))successBlock fail:(void(^)(NSURLResponse *response, NSError *error))failBlock;

@end
