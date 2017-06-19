//
//  MyTabBarController.m
//  GitDmoe
//
//  Created by luo on 17/6/16.
//  Copyright © 2017年 VCredit. All rights reserved.
//

#import "MyTabBarController.h"
#import "BaseNavigationController.h"
#import "HomeViewController.h"
#import "TestViewController.h"
#import "MyViewController.h"

@interface MyTabBarController ()

@end

@implementation MyTabBarController

static  MyTabBarController *tabbar = nil;

+(id)shareTabBar
{
    @synchronized ([MyTabBarController class]) {
        if (!tabbar) {
            tabbar = [[MyTabBarController alloc]init];
        }

    }
    return tabbar;
    
}

-(instancetype)init
{
    if (tabbar) {
        return  tabbar;
    }
    self = [super init];
    return self;
    
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

-(void)setbaseVC
{
    HomeViewController *homeVC = [HomeViewController new];
    TestViewController *testVC = [TestViewController new];
    MyViewController   *myVC = [MyViewController new];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
