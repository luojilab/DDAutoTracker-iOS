//
//  DDItemModel.m
//  DDAutoTracker_Example
//
//  Created by 王海亮 on 2017/12/14.
//  Copyright © 2017年 yusipeng. All rights reserved.
//

#import "DDItemModel.h"

@implementation DDItemModel

- (instancetype)initWithTitle:(NSString *)title
                        intro:(NSString *)intro {
    if (self = [super init]) {
        _title = [title copy];
        _intro = [intro copy];
    }
    return self;
}

@end
