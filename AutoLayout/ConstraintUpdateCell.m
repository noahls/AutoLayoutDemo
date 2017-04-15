//
//  ConstraintUpdateCell.m
//  AutoLayout
//
//  Created by yanliu on 14/04/2017.
//  Copyright © 2017 huawei. All rights reserved.
//

#import "ConstraintUpdateCell.h"
#import "Masonry.h"
@implementation ConstraintUpdateCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _labelA = [[UILabel alloc] init];
        _labelA.text = @"Hello";
        _labelA.font = [UIFont systemFontOfSize:26];
        [self.contentView addSubview:_labelA];
        
        
        _labelB = [[UILabel alloc] init];
        _labelB.numberOfLines = 0;
        _labelB.text = @"his may not seem very useful at first. In fact, why not just increase the content size? Well, you should avoid changing the content size of a scroll view unless you have to. To understand why";
        [self .contentView addSubview:_labelB];
        
        _changeBtn = [[UIButton alloc] init];
        [self.contentView addSubview:_changeBtn];
        [_changeBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_changeBtn addTarget:self action:@selector(change:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)setupSubViews{
    if (_isExpanded) {
        [_labelA mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(16);
            make.top.equalTo(self.contentView).offset(16);
        }];
        
        [_changeBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.lessThanOrEqualTo(_labelA.mas_right).offset(8);
            make.right.equalTo(self.contentView).offset(-16);
            make.top.equalTo(_labelA);
        }];
        
        _labelB.hidden = NO;
        [_labelB mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_labelA.mas_bottom).offset(8);
            make.left.equalTo(_labelA);
            make.right.lessThanOrEqualTo(self.contentView).offset(-50);
            make.bottom.equalTo(self.contentView).offset(-16);
        }];
        
        [_changeBtn setTitle:@"收起" forState:UIControlStateNormal];
    }else{
        [_labelB mas_remakeConstraints:^(MASConstraintMaker *make) {
            
        }];
        _labelB.hidden = YES;
        
        [_labelA mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(16);
            make.top.equalTo(self.contentView).offset(16);
            make.bottom.equalTo(self.contentView).offset(-16);
        }];
        
        [_changeBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.lessThanOrEqualTo(_labelA.mas_right).offset(8);
            make.right.equalTo(self.contentView).offset(-16);
            make.top.equalTo(_labelA);
        }];
        
        [_changeBtn setTitle:@"展开" forState:UIControlStateNormal];
    }
}

- (void)change:(id)sender{
    if (_handleChange) {
        _handleChange();
    }
}

@end
