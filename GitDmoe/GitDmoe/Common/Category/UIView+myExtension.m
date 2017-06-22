//
//  UIView+myExtension.m
//  GitDmoe
//
//  Created by luo on 2017/6/20.
//  Copyright © 2017年 VCredit. All rights reserved.
//

#import "UIView+myExtension.h"

@implementation UIView (myExtension)

-(void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

-(CGSize)size
{
    return self.frame.size;
}


-(void)setX:(CGFloat)X
{
    CGRect frame = self.frame;
    frame.origin.x = X;
    self.frame = frame;
}

-(CGFloat)X
{
    return self.frame.origin.x;
}

-(void)setY:(CGFloat)Y
{
    CGRect frame = self.frame;
    frame.origin.y = Y;
    self.frame = frame;
}
-(CGFloat)Y
{
   return  self.frame.origin.y;
}

-(void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

-(CGFloat)width
{
   return  self.frame.size.width;
}

-(void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

-(CGFloat)height
{
    return self.frame.size.height;
}

-(void)setOrigin:(CGPoint)origin
{
    CGRect  frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
    
}

-(CGPoint)origin
{
    return self.frame.origin;
}


-(void)setCenterX:(CGFloat)centerX
{
    self.center = CGPointMake(centerX, self.center.y);
}

-(CGFloat)centerX
{
    return self.center.x;
}

-(void)setCenterY:(CGFloat)centerY
{
    self.center = CGPointMake(self.center.x, centerY);
}

-(CGFloat)centerY
{
    return self.center.y;
}








-(BOOL)isShowingOnKeyWindow
{
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    
    CGRect   newRect = [keyWindow convertRect:self.frame fromView:self.superview];
   //等价于 CGRect sameRect  = [self convertRect:self.frame toView:keyWindow];
    CGRect  keyRect = keyWindow.bounds;
    BOOL intersects = CGRectIntersectsRect(keyRect, newRect);
    return !self.isHidden && self.alpha > 0.01 && self.window == keyWindow && intersects;
}

@end

















