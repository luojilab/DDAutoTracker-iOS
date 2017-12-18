//
//  DDAutoTrackerManager.m
//  DDAutoTracker
//
//  Created by 王海亮 on 2017/12/18.
//

#import "DDAutoTrackerManager.h"
#import "UIButton+DDAutoTracker.h"
#import "UITableView+DDAutoTracker.h"
#import "UICollectionView+DDAutoTracker.h"
#import "UIView+DDAutoTracker.h"

@implementation DDAutoTrackerManager

+ (instancetype)sharedInstance {
    static id _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}

#pragma mark - public method
/**
 开始打点
 
 @param successBlock 成功回调
 @param debugBlock 调试模式回调
 */
- (void)startWithCompletionBlockWithSuccess:(DDAutoTrackerManagerBlock)successBlock debug:(DDAutoTrackerManagerBlock)debugBlock {
    static dispatch_once_t once;
    dispatch_once(&once, ^ {
        [UIButton startTracker];
        [UITableView startTracker];
        [UICollectionView startTracker];
        [UIView startTracker];
    });
    
    self.successBlock = successBlock;
    self.debugBlock = debugBlock;
}

@end
