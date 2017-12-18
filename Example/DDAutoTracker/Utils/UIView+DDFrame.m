//
//  UIView+DDFrame.m
//  DDAutoTracker_Example
//
//  Created by 王海亮 on 2017/12/14.
//  Copyright © 2017年 yusipeng. All rights reserved.
//

#import "UIView+DDFrame.h"

@implementation UIView (DDFrame)

-(CGFloat)dd_x {
    return self.frame.origin.x;
}

-(void)setDd_x:(CGFloat)x {
    CGRect rect = self.frame;
    rect.origin.x = x;
    self.frame = rect;
}

-(CGFloat)dd_y {
    return self.frame.origin.y;
}

-(void)setDd_y:(CGFloat)y {
    CGRect rect = self.frame;
    rect.origin.y = y;
    self.frame = rect;
}

-(CGFloat)dd_width {
    return self.frame.size.width;
}

-(void)setDd_width:(CGFloat)width {
    CGRect rect = self.frame;
    rect.size.width = width;
    self.frame = rect;
}

-(CGFloat)dd_height {
    return self.frame.size.height;
}

-(void)setDd_height:(CGFloat)height {
    CGRect rect = self.frame;
    rect.size.height = height;
    self.frame = rect;
}

-(CGFloat)dd_centerX {
    return self.center.x;
}

-(void)setDd_centerX:(CGFloat)centerX {
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

-(CGFloat)dd_centerY {
    return self.center.y;
}

-(void)setDd_centerY:(CGFloat)centerY {
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGSize)dd_size {
    return self.frame.size;
}

- (void)setDd_size:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGFloat)dd_top {
    return self.frame.origin.y;
}

- (void)setDd_top:(CGFloat)t {
    self.frame = CGRectMake(self.dd_left, t, self.dd_width, self.dd_height);
}

- (CGFloat)dd_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setDd_bottom:(CGFloat)b {
    self.frame = CGRectMake(self.dd_left, b - self.dd_height, self.dd_width, self.dd_height);
}

- (CGFloat)dd_left {
    return self.frame.origin.x;
}

- (void)setDd_left:(CGFloat)l {
    self.frame = CGRectMake(l, self.dd_top, self.dd_width, self.dd_height);
}

- (CGFloat)dd_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setDd_right:(CGFloat)r {
    self.frame = CGRectMake(r - self.dd_width, self.dd_top, self.dd_width, self.dd_height);
}

@end
