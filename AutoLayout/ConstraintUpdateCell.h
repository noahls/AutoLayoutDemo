//
//  ConstraintUpdateCell.h
//  AutoLayout
//
//  Created by yanliu on 14/04/2017.
//  Copyright © 2017 huawei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConstraintUpdateCell : UITableViewCell
@property (nonatomic,strong) UILabel *labelA;
@property (nonatomic,strong) UIButton *changeBtn;
@property (nonatomic,strong) UILabel *labelB;

@property (nonatomic,assign) BOOL isExpanded;

@property (nonatomic,copy) void (^handleChange)();
- (void)setupSubViews;
@end
