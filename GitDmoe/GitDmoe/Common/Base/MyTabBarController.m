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
    @synchronized ([MyTabBarController class])
    {
        if (!tabbar)
        {
            tabbar = [[MyTabBarController alloc]init];
        }

    }
    return tabbar;
    
}

-(instancetype)init
{
    if (tabbar)
    {
        return  tabbar;
    }
    
    self = [super init];
    return self;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setbaseVC];
}

-(void)setbaseVC
{
    self.view.backgroundColor = [UIColor whiteColor];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} forState:UIControlStateSelected];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blueColor]} forState:UIControlStateNormal];
    NSArray *titleArr = @[@"首页",@"测试",@"我的"];
    NSArray *normalImages = @[@"tabbar_home_normal",@"tabbar_crown_normal",@"tabbar_mine_normal"];
    NSArray *selectedImage = @[@"tabbar_home_selected",@"tabbar_crown_selected",@"tabbar_mine_selected"];
    NSArray *vcArr = @[NSStringFromClass([HomeViewController class]),NSStringFromClass([TestViewController class]),NSStringFromClass([MyViewController class])];
    self.viewControllers = [self tabbarVC:vcArr titleArr:titleArr normalArr:normalImages selectedArr:selectedImage];
    self.selectedIndex = 0;
}

-(NSArray *)tabbarVC:(NSArray *)arrVC titleArr:(NSArray *)titleArr  normalArr:(NSArray *)normalArr selectedArr:(NSArray *)selectedArr

{
    NSMutableArray *returnArr = [[NSMutableArray alloc]initWithCapacity:arrVC.count];
    for (int i = 0; i < arrVC.count; i++) {
        NSString *titleStr = titleArr[i];
        NSString *vcStr = arrVC[i];
        if (NSClassFromString(vcStr))
        {
            UIViewController *vc = [[NSClassFromString(vcStr) alloc]init];
            UIImage *normalImage = [UIImage imageNamed:normalArr[i]];
            vc.tabBarItem.image = [normalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            UIImage *selectedImage = [UIImage imageNamed:selectedArr[i]];
            vc.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            vc.tabBarItem.title = titleStr;
            BaseNavigationController *baseNavBar = [[BaseNavigationController alloc]initWithRootViewController:vc];
            [returnArr addObject:baseNavBar];
        }
    }
    return [returnArr copy];
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
