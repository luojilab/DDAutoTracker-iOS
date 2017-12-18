//
//  UIView+DDFrame.h
//  DDAutoTracker_Example
//
//  Created by 王海亮 on 2017/12/14.
//  Copyright © 2017年 yusipeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (DDFrame)

@property (nonatomic, assign) CGFloat dd_x;
@property (nonatomic, assign) CGFloat dd_y;
@property (nonatomic, assign) CGFloat dd_width;
@property (nonatomic, assign) CGFloat dd_height;
@property (nonatomic, assign) CGFloat dd_centerX;
@property (nonatomic, assign) CGFloat dd_centerY;
@property (nonatomic, assign) CGSize dd_size;
@property (nonatomic, assign) CGFloat dd_top;
@property (nonatomic, assign) CGFloat dd_bottom;
@property (nonatomic, assign) CGFloat dd_left;
@property (nonatomic, assign) CGFloat dd_right;

@end
