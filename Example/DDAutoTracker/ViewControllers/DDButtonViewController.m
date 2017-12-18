//
//  DDButtonViewController.m
//  DDAutoTracker_Example
//
//  Created by 王海亮 on 2017/12/14.
//  Copyright © 2017年 yusipeng. All rights reserved.
//

#import "DDButtonViewController.h"
#import "UIView+DDFrame.h"

@interface DDButtonViewController ()

@property (nonatomic, strong) UIButton *trackerButton;

@end

@implementation DDButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupSubViews];
    
    //配置打点info信息
    self.ddInfoDictionary = @{@"id":@"your id",
                              @"type":@"your type"};
}

- (void)setupSubViews {
    [self.view addSubview:self.trackerButton];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.trackerButton.dd_width = 180.f;
    self.trackerButton.dd_height = 44.f;
    self.trackerButton.center = self.view.center;
}

#pragma mark - button action

- (void)trackerButtonClick:(UIButton *)sender {
    
}

#pragma mark - setters and getters

- (UIButton *)trackerButton {
    if (nil == _trackerButton) {
        _trackerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_trackerButton setTitle:@"click me" forState:UIControlStateNormal];
        [_trackerButton setBackgroundColor:[UIColor orangeColor]];
        [_trackerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_trackerButton addTarget:self
                           action:@selector(trackerButtonClick:)
                 forControlEvents:UIControlEventTouchUpInside];
    }
    return _trackerButton;
}


@end
