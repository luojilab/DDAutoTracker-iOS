//
//  DDExampleModel.h
//  DDAutoTracker_Example
//
//  Created by 王海亮 on 2017/12/14.
//  Copyright © 2017年 yusipeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDExampleModel : NSObject

@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, strong, readonly) Class controllerClass;

- (instancetype)initWithName:(NSString *)name
             controllerClass:(Class)controllerClass;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end
