//
//  UIView+myExtension.h
//  GitDmoe
//
//  Created by luo on 2017/6/20.
//  Copyright © 2017年 VCredit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (myExtension)
@property(assign, nonatomic) CGFloat height;
@property(assign, nonatomic) CGFloat width;
@property(assign, nonatomic) CGFloat X;
@property(assign, nonatomic) CGFloat Y;


@property(assign, nonatomic) CGSize  size;
@property(assign, nonatomic) CGPoint origin;
@property(assign, nonatomic) CGFloat centerX;
@property(assign, nonatomic) CGFloat centerY;



-(BOOL)isShowingOnKeyWindow;
@end
