//
//  BaseNavigationController.m
//  GitDmoe
//
//  Created by luo on 17/6/18.
//  Copyright © 2017年 VCredit. All rights reserved.
//

#import "BaseNavigationController.h"
#import "MyMacros.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController




+ (void)initialize
{
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    if (self.childViewControllers.count ) {
        
        UIButton *backBtn =[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 45, 21)];
        [backBtn setTitle:@"返回" forState:UIControlStateNormal];
        [backBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
        [backBtn setTitleColor:MyColor(3, 3, 3) forState:UIControlStateNormal];
        [backBtn setTitleColor:MyColor(203, 203, 203) forState:UIControlStateHighlighted];
        [backBtn addTarget:self action:@selector(backItemAction) forControlEvents:UIControlEventTouchUpInside];
        [backBtn setImage:[UIImage imageNamed:@"back_icon"] forState:UIControlStateNormal];
        // top, left, bottom, right
        [backBtn setImageEdgeInsets:UIEdgeInsetsMake(0, -5, 0, 18)];
        UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
        viewController.navigationItem.leftBarButtonItem =  backItem;
    }
    [super pushViewController:viewController animated:animated];
    
}

-(void)backItemAction
{
    [self popViewControllerAnimated:YES];
}





- (void)viewDidLoad
{
    [super viewDidLoad];
    
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
