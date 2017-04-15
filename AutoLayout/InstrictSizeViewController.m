//
//  InstrictSizeViewController.m
//  AutoLayout
//
//  Created by yanliu on 05/04/2017.
//  Copyright © 2017 huawei. All rights reserved.
//

#import "InstrictSizeViewController.h"
#import "Masonry.h"
@interface InstrictSizeViewController ()

@end

@implementation InstrictSizeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
//    UILabel *label = [[UILabel alloc] init];
//    label.font = [UIFont systemFontOfSize:15];
//    label.text = @"Hello";
//    [self.view addSubview:label];
//    [label mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.view.mas_left).offset(16);
//        make.top.equalTo(self.view.mas_top).offset(16);
//    }];
//    [label setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisVertical];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    [self.view addSubview:titleLabel];
    titleLabel.text = @"Each of these constraints can have its own priority. By default, ";
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(16);
        make.top.equalTo(self.view.mas_top).offset(100);
    }];
    
    UILabel *timeLabel = [[UILabel alloc] init];
    timeLabel.text = @"2017/03/12 18:20:22";
    [self.view addSubview:timeLabel];
    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(titleLabel.mas_right).offset(8);
        make.top.equalTo(titleLabel.mas_top);
        make.right.lessThanOrEqualTo(self.view.mas_right).offset(-8);
    }];
//    [timeLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
