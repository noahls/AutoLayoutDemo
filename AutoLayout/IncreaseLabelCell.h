//
//  IncreaseLabelCell.h
//  AutoLayout
//
//  Created by yanliu on 14/04/2017.
//  Copyright © 2017 huawei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IncreaseLabelCell : UITableViewCell
@property (nonatomic,strong) UILabel *increaseLabel;
@property (nonatomic,strong) UIButton *showMoreBtn;
@property (nonatomic,assign) BOOL isExpanded;
@property (nonatomic,copy) void (^handleIncrease)();
@end
