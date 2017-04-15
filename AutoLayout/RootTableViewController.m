//
//  RootTableViewController.m
//  AutoLayout
//
//  Created by yanliu on 2017/3/24.
//  Copyright © 2017年 huawei. All rights reserved.
//

#import "RootTableViewController.h"
#import "SimpleViewProcessViewController.h"
#import "InstrictSizeViewController.h"
#import "ScrollViewSampleVC.h"
#import "AutoCellHeightViewController.h"
@interface RootTableViewController ()
@property (nonatomic,copy) NSArray *items;
@end

@implementation RootTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"示例";
    _items = @[@"View的展示过程",@"Intrinsic content size",@"ScrollView",@"AutoCellHeight"];
    [self setupTableView];
}

- (void)setupTableView{
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    self.tableView.tableFooterView = [[UIView alloc] init];
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
    return _items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    cell.textLabel.text = _items[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController *vc = nil;
    switch (indexPath.row) {
        case 0:{
            vc = [[SimpleViewProcessViewController alloc] init];
            break;
        }
        case 1:{
            vc = [[InstrictSizeViewController alloc] init];
            break;
        }
        case 2:{
            vc = [[ScrollViewSampleVC alloc] init];
            break;
        }
        case 3:{
            vc = [[AutoCellHeightViewController alloc] init];
        }
            
        default:
            break;
    }
    vc.navigationItem.title = _items[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];

}

@end
