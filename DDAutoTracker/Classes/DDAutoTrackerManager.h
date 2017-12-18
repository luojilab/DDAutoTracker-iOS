//
//  DDAutoTrackerManager.h
//  DDAutoTracker
//
//  Created by 王海亮 on 2017/12/18.
//

#import <Foundation/Foundation.h>

static NSString *DDAutoTrackerEventIDKey = @"DD_TRACKER_EVENTID_KEY";
static NSString *DDAutoTrackerInfoKey = @"DD_TRACKER_INFO_KEY";

typedef void(^DDAutoTrackerManagerBlock)(NSDictionary *trackerDictionary);

@interface DDAutoTrackerManager : NSObject

/**
 是否开启调试模式
 */
@property (nonatomic, assign) BOOL isDebug;

/**
 配置数据
 */
@property (nonatomic, strong) NSArray *configArray;

@property (nonatomic, copy) DDAutoTrackerManagerBlock successBlock;
@property (nonatomic, copy) DDAutoTrackerManagerBlock debugBlock;

+ (DDAutoTrackerManager *)sharedInstance;

/**
 开始打点
 
 @param successBlock 成功回调
 @param debugBlock 调试模式回调
 */
- (void)startWithCompletionBlockWithSuccess:(DDAutoTrackerManagerBlock)successBlock debug:(DDAutoTrackerManagerBlock)debugBlock;

@end
