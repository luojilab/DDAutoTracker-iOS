#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "DDAutoTracker.h"
#import "DDAutoTrackerManager.h"
#import "DDAutoTrackerOperation.h"
#import "NSObject+DDAutoTracker.h"
#import "UIButton+DDAutoTracker.h"
#import "UICollectionView+DDAutoTracker.h"
#import "UITableView+DDAutoTracker.h"
#import "UIView+DDAutoTracker.h"

FOUNDATION_EXPORT double DDAutoTrackerVersionNumber;
FOUNDATION_EXPORT const unsigned char DDAutoTrackerVersionString[];

