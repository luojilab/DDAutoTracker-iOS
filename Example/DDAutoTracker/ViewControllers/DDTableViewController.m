//
//  DDTableViewController.m
//  DDAutoTracker_Example
//
//  Created by 王海亮 on 2017/12/14.
//  Copyright © 2017年 yusipeng. All rights reserved.
//

#import "DDTableViewController.h"
#import "DDItemModel.h"

@interface DDTableViewController ()

@property (nonatomic, strong) NSArray<DDItemModel *> *data;

@end

@implementation DDTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *tableViewCellIdentifier = @"tableViewCellIdentifier";
    UITableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:tableViewCellIdentifier];
    if (nil == tableViewCell) {
        tableViewCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
                                               reuseIdentifier:tableViewCellIdentifier];
        tableViewCell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    if (self.data.count > indexPath.row) {
        DDItemModel *model = [self.data objectAtIndex:indexPath.row];
        tableViewCell.textLabel.text = model.title;
        tableViewCell.detailTextLabel.text = model.intro;
        
        //配置打点数据
        [tableViewCell configInfoData:model];
    }
    return tableViewCell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - setters and getters

- (NSArray<DDItemModel *> *)data {
    if (nil == _data) {
        _data = @[[[DDItemModel alloc] initWithTitle:@"title a" intro:@"intro a"],
                  [[DDItemModel alloc] initWithTitle:@"title b" intro:@"intro b"],
                  [[DDItemModel alloc] initWithTitle:@"title c" intro:@"intro c"],
                  [[DDItemModel alloc] initWithTitle:@"title d" intro:@"intro d"],
                  [[DDItemModel alloc] initWithTitle:@"title e" intro:@"intro e"],];
    }
    return _data;
}

@end
