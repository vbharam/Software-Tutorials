//
//  HTTPService.m
//  CodecoopTutorial
//
//  Created by Vishal Bharam on 3/18/17.
//  Copyright © 2017 Codecoop. All rights reserved.
//

#import "HTTPService.h"

#define URL_BASE "http://localhost:8000"
#define URL_TUTORIALS "/tutorials"

@implementation HTTPService

+(id) instance {
    static HTTPService *sharedInstance = nil;
    // Will it not be set to nil all the time? NOOOO
    // Given that it is static, it will only be created once and won't be created again
    
    // Synchronized means its going to work with multy-threading and you are not going to have lockups on different threads
    @synchronized (self) {
        if (sharedInstance == nil) {
            sharedInstance = [[self alloc] init];
        }
    }
    
    return sharedInstance;
}

-(void) getTutorials:(onComplete)completionHandler {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%s%s", URL_BASE, URL_TUTORIALS]];
    // Single Server:
    NSURLSession *session = [NSURLSession sharedSession];
    
    // GET Request:
    [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (data != nil) {
            NSError *err;
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&err];
            
            if (err == nil) {
                completionHandler(json, nil);
            } else {
                completionHandler(nil, @"Corrupt Data");
            }
        } else {
            NSLog(@"Err: %@", error.debugDescription);
            completionHandler(nil, @"Network Error!");
        }
        
    }] resume];
}


@end
