//
//  SimpleViewProcessViewController.m
//  AutoLayout
//
//  Created by yanliu on 2017/3/24.
//  Copyright © 2017年 huawei. All rights reserved.
//

#import "SimpleViewProcessViewController.h"
#import "CustomView.h"
@interface SimpleViewProcessViewController ()

@end

@implementation SimpleViewProcessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addCustomView];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addCustomView{
    CustomView *customView = [[CustomView alloc] initWithFrame:CGRectMake(100, 200, 50, 60)];
    customView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:customView];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
