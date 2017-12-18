//
//  DDGestureViewController.m
//  DDAutoTracker_Example
//
//  Created by 王海亮 on 2017/12/14.
//  Copyright © 2017年 yusipeng. All rights reserved.
//

#import "DDGestureViewController.h"
#import "UIView+DDFrame.h"

@interface DDGestureViewController ()

@property (nonatomic, strong) UILabel *gestureLabel;

@end

@implementation DDGestureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupSubviews];
    
    //配置打点info信息
    self.ddInfoDictionary = @{@"id":@"your id",
                              @"type":@"your type"};
}

- (void)setupSubviews {
    [self.view addSubview:self.gestureLabel];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.gestureLabel.dd_width = 180.f;
    self.gestureLabel.dd_height = 44.f;
    self.gestureLabel.center = self.view.center;
}
#pragma mark - label action

- (void)gestureLabelClick:(id)sender {
    
}

#pragma mark - setters and getters

- (UILabel *)gestureLabel {
    if (nil == _gestureLabel) {
        _gestureLabel = [[UILabel alloc] init];
        _gestureLabel.backgroundColor = [UIColor orangeColor];
        _gestureLabel.textColor = [UIColor whiteColor];
        _gestureLabel.font = [UIFont boldSystemFontOfSize:16.f];
        _gestureLabel.textAlignment = NSTextAlignmentCenter;
        _gestureLabel.text = @"click me";
        _gestureLabel.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureLabelClick:)];
        [_gestureLabel addGestureRecognizer:tap];
    }
    return _gestureLabel;
}

@end
