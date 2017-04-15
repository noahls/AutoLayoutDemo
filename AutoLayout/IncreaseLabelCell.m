//
//  IncreaseLabelCell.m
//  AutoLayout
//
//  Created by yanliu on 14/04/2017.
//  Copyright © 2017 huawei. All rights reserved.
//

#import "IncreaseLabelCell.h"
#import "Masonry.h"
@implementation IncreaseLabelCell

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
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews{
    _increaseLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_increaseLabel];
    
    [_increaseLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(16);
        make.top.equalTo(self.contentView).offset(16);
        make.right.lessThanOrEqualTo(self.contentView).offset(-16);
    }];
    
    _showMoreBtn = [[UIButton alloc] init];
    [self.contentView addSubview:_showMoreBtn];
    [_showMoreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView).offset(-16);
        make.top.equalTo(_increaseLabel.mas_bottom).offset(8);
    }];
    [_showMoreBtn setTitle:@"展开" forState:UIControlStateNormal];
    [_showMoreBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_showMoreBtn addTarget:self action:@selector(showMore:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)showMore:(id)sender{
    _isExpanded = !_isExpanded;
    if (_isExpanded) {
        [_showMoreBtn setTitle:@"收起" forState:UIControlStateNormal];
        _increaseLabel.numberOfLines = 0;
    }else{
        [_showMoreBtn setTitle:@"展开" forState:UIControlStateNormal];
        _increaseLabel.numberOfLines = 1;
    }
    
    if (_handleIncrease) {
        _handleIncrease();
    }
}



@end
