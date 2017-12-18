//
//  DDAppDelegate.m
//  DDAutoTracker
//
//  Created by yusipeng on 12/18/2017.
//  Copyright (c) 2017 yusipeng. All rights reserved.
//

#import "DDAppDelegate.h"
#import "DDExampleViewController.h"

@implementation DDAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    // Override point for customization after application launch.
    
    DDExampleViewController *exampleViewController = [[DDExampleViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:exampleViewController];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    
    //开启打点
    [[DDAutoTrackerManager sharedInstance] startWithCompletionBlockWithSuccess:^(NSDictionary *trackerDictionary) {
        //成功打点回调
    } debug:^(NSDictionary *trackerDictionary) {
        //调试模式回调
    }];
    //开启调试模式
    [DDAutoTrackerManager sharedInstance].isDebug = YES;
    //读取本地配置文件
    NSString * filePath = [[NSBundle mainBundle] pathForResource:@"tracker" ofType:@"json"];
    NSData * jsonData = [NSData dataWithContentsOfFile:filePath];
    if (jsonData) {
        NSError *error;
        NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options: NSJSONReadingMutableContainers error: &error];
        if (nil == error &&
            jsonArray) {
            [DDAutoTrackerManager sharedInstance].configArray = jsonArray;
        }
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
