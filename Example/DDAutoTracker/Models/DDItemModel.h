//
//  DDItemModel.h
//  DDAutoTracker_Example
//
//  Created by 王海亮 on 2017/12/14.
//  Copyright © 2017年 yusipeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDItemModel : NSObject

@property (nonatomic, strong, readonly) NSString *title;
@property (nonatomic, strong, readonly) NSString *intro;

- (instancetype)initWithTitle:(NSString *)title
                        intro:(NSString *)intro;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end
