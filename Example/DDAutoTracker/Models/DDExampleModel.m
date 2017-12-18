//
//  DDExampleModel.m
//  DDAutoTracker_Example
//
//  Created by 王海亮 on 2017/12/14.
//  Copyright © 2017年 yusipeng. All rights reserved.
//

#import "DDExampleModel.h"

@implementation DDExampleModel

- (instancetype)initWithName:(NSString *)name
             controllerClass:(Class)controllerClass {
    if (self = [super init]) {
        _name = [name copy];
        _controllerClass = [controllerClass copy];
    }
    return self;
}

@end
