//
//  MyHttpClient+FailureHandler.h
//  GitDmoe
//
//  Created by luo on 2017/6/22.
//  Copyright © 2017年 VCredit. All rights reserved.
//

#import "MyHttpClient.h"

@interface MyHttpClient (FailureHandler)
@property(nonatomic, strong) NSMutableSet *failureQueue;

@end
