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

-(void)requestWithOptions:(NSDictionary *)options completionBlock:(void(^)(NSError *, NSURLResponse *, NSData *))block;

@end
