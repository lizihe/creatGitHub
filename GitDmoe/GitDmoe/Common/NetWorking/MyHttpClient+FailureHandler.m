//
//  MyHttpClient+FailureHandler.m
//  GitDmoe
//
//  Created by luo on 2017/6/22.
//  Copyright © 2017年 VCredit. All rights reserved.
//

#import "MyHttpClient+FailureHandler.h"
#import <objc/runtime.h>

static const void *MyFailureQueue = &MyFailureQueue;
@implementation MyHttpClient (FailureHandler)

-(void)addFailureObserver
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(networkStatusChanged:) name:AFNetworkingReachabilityDidChangeNotification object:nil];
}


- (void)setFailureQueue:(NSMutableSet *)failureQueue
{
    objc_setAssociatedObject(self, MyFailureQueue, failureQueue, OBJC_ASSOCIATION_RETAIN);
    
    
}

-(NSMutableSet *)failureQueue
{
    NSMutableSet *set = objc_getAssociatedObject(self, MyFailureQueue);
    if (!set) {
        set = [[NSMutableSet alloc]initWithCapacity:1];
        self.failureQueue = set;
    }
    return set;
}

-(void)networkStatusChanged:(NSNotification *)notif

{
    
}







@end
