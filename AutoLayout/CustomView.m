//
//  CustomView.m
//  AutoLayout
//
//  Created by yanliu on 2017/3/24.
//  Copyright © 2017年 huawei. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    NSLog(@"call draw rect");
    [super drawRect:rect];
    
    self.frame = CGRectMake(100, 200, 230, 533);
    NSLog(@"frame after is %@",NSStringFromCGRect(self.frame));
}


- (void)setNeedsLayout{
    NSLog(@"set neess layout");
    [super setNeedsLayout];
}

- (void)setNeedsDisplay{
    NSLog(@"set needs display");
    [super setNeedsDisplay];
}

- (void)layoutSubviews{
    NSLog(@"layout subviews");
    NSLog(@"frame before is %@",NSStringFromCGRect(self.frame));
    [super layoutSubviews];
    self.center = CGPointMake(300, 400);
//    self.transform = CGAffineTransformScale(self.transform, 1.5, 0.5);
    NSLog(@"frame after is %@",NSStringFromCGRect(self.frame));
}

//- (CGSize)intrinsicContentSize{
//    return CGSizeMake(100, 200);
//}
@end
