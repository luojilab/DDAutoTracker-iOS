//
//  DDAutoTrackerOperation.h
//  DDAutoTracker
//
//  Created by 王海亮 on 2017/12/18.
//

#import <Foundation/Foundation.h>

@interface DDAutoTrackerOperation : NSObject

+ (DDAutoTrackerOperation *)sharedInstance;

/**
 发送日志
 
 @param eventId 事件id
 @param info 日志内容
 */
- (void)sendTrackerData:(NSString *)eventId info:(NSDictionary *)info;

@end
