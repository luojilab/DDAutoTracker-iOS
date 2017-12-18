//
//  DDExampleViewController.m
//  DDAutoTracker_Example
//
//  Created by 王海亮 on 2017/12/14.
//  Copyright © 2017年 yusipeng. All rights reserved.
//

#import "DDExampleViewController.h"
//Models
#import "DDExampleModel.h"
//Controllers
#import "DDButtonViewController.h"
#import "DDTableViewController.h"
#import "DDCollectionViewController.h"
#import "DDGestureViewController.h"

@interface DDExampleViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray<DDExampleModel *> *data;

@end

@implementation DDExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = NSStringFromClass([self class]);
    [self setupSubViews];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:nil
                                                                            action:nil];
}

- (void)setupSubViews {
    [self.view addSubview:self.tableView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.tableView.frame = self.view.bounds;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *demoCellIdentifier = @"demoCellIdentifier";
    UITableViewCell *demoCell = [tableView dequeueReusableCellWithIdentifier:demoCellIdentifier];
    if (nil == demoCell) {
        demoCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                          reuseIdentifier:demoCellIdentifier];
        demoCell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    if (self.data.count > indexPath.row) {
        DDExampleModel *model = [self.data objectAtIndex:indexPath.row];
        demoCell.textLabel.text = model.name;
        //配置打点数据
        [demoCell configInfoData:model];
    }
    return demoCell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.data.count > indexPath.row) {
        DDExampleModel *item = [self.data objectAtIndex:indexPath.row];
        if (item.controllerClass) {
            id obj = [[item.controllerClass alloc] init];
            if ([obj isKindOfClass:[UIViewController class]]) {
                UIViewController *viewController = (UIViewController *)obj;
                viewController.title = NSStringFromClass(item.controllerClass);
                viewController.view.backgroundColor = [UIColor whiteColor];
                [self.navigationController pushViewController:viewController animated:YES];
            }
        }
    }
}

#pragma mark - setters and getters

- (UITableView *)tableView {
    if (nil == _tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

- (NSArray<DDExampleModel *> *)data {
    if (nil == _data) {
        _data = [[NSArray alloc] initWithObjects:
                 [[DDExampleModel alloc] initWithName:@"UIButton Example"
                                      controllerClass:[DDButtonViewController class]],
                 [[DDExampleModel alloc] initWithName:@"UITableView Example"
                                      controllerClass:[DDTableViewController class]],
                 [[DDExampleModel alloc] initWithName:@"UICollectionView Example"
                                      controllerClass:[DDCollectionViewController class]],
                 [[DDExampleModel alloc] initWithName:@"Gesture Example"
                                      controllerClass:[DDGestureViewController class]],
                 nil];
    }
    return _data;
}

@end
