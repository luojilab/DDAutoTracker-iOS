//
//  NSObject+DDAutoTracker.h
//  DDAutoTracker
//
//  Created by 王海亮 on 2017/12/18.
//

#import <Foundation/Foundation.h>

@interface NSObject (DDAutoTracker)

@property (nonatomic ,strong) NSDictionary *ddInfoDictionary;

- (void)configInfoData:(id)obj;

@end
