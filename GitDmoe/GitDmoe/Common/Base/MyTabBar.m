//
//  MyTabBar.m
//  GitDmoe
//
//  Created by luo on 2017/6/20.
//  Copyright © 2017年 VCredit. All rights reserved.
//

#import "MyTabBar.h"
#import "UIView+myExtension.h"

@interface MyTabBar ()
@property(weak,nonatomic) UIButton *publishBtn;

@end

@implementation MyTabBar

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self  setBackgroundImage:[UIImage imageNamed:@"tabbar-light"]];
        UIButton *publishBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishBtn setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishBtn setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateHighlighted];
        [publishBtn addTarget:self action:@selector(publishBtnClick) forControlEvents:UIControlEventTouchUpInside];
        publishBtn.size = publishBtn.currentBackgroundImage.size;
        [self addSubview:publishBtn];
        self.publishBtn = publishBtn;
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    static  BOOL added = NO;
    CGFloat width = self.width;
    CGFloat height = self.height;
    self.publishBtn.center = CGPointMake(width*0.5, height*0.5);
    CGFloat buttonY = 0;
    CGFloat buttonW = width/4;
    CGFloat buttonH = height;
    NSInteger index = 0;
    for (UIButton *btn in self.subviews)
    {
        if (![btn isKindOfClass:[UIControl class]] || btn == self.publishBtn)
        {
           continue;
        }
        //if (![btn isKindOfClass:[UIControl class]] || btn == self.publishBtn)continue;
            CGFloat buttonX = buttonW*((index > 1)? (index+1):index);
          //  CGFloat buttonX = buttonW*index;
            btn.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
            index ++;
            if (added == NO)
            {
                [btn addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
            }
    }
    added = YES;
}

-(void)publishBtnClick
{
    
}

-(void)buttonClick

{
    
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
