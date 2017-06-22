//
//  MyHttpClient.h
//  GitDmoe
//
//  Created by luo on 2017/6/22.
//  Copyright © 2017年 VCredit. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import "MyRequest.h"
#import <AFHTTPSessionManager.h>

@class MyHttpClient;
@protocol MyHttpClientDelegate <NSObject>

@optional


- (void)httpClient:(MyHttpClient *)client statusChange:(AFNetworkReachabilityStatus *)status;
- (BOOL)httpClient:(MyHttpClient *)client filterResponse:(NSDictionary *)dic error:(NSError *)error;

-(BOOL)httpClient:(MyHttpClient *)client filterRetryFailureSessionManager:(AFHTTPSessionManager *)manager error:(NSError *)error;

@end

@interface MyHttpClient : NSObject

@property(weak, nonatomic) id<MyHttpClientDelegate>delegate;





- (void)setRequestHeaderField:(NSString *)accessToken;

@end
