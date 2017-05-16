//
//  TopNavView.m
//  BigMouse
//
//  Created by ARIST on 15/8/19.
//  Copyright (c) 2015年 深圳市葵花子科技有限公司. All rights reserved.
//

#import "TopNavView.h"

@implementation TopNavView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIView *view = [[[NSBundle mainBundle] loadNibNamed:@"TopNavView" owner:self options:nil] lastObject];
        self.height = 64;
        view.frame = CGRectMake(0, 20, KScreenWidth, 44);
        _titleLabel.textColor=WhiteColor;
        _titleLabel.text = @"";
//        _viewSep.backgroundColor = kCyColorFromHex(0xff4046);
        _leftNavBtn.tintColor = [UIColor whiteColor];
        _rightNavBtn.tintColor = [UIColor whiteColor];
        
        [_leftNavBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_leftNavBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
       
        [_rightNavBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_rightNavBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        
        _constantViewSepHeight.constant = .5;
        
        self.backgroundColor = kColorStyle;
        
//        self.backgroundColor = kCyColorFromHex(0xff4046);
        
         _spearView=[[UIView alloc]initWithFrame:CGRectMake(0, 63, KScreenWidth, 1)];
        
//        _spearView.backgroundColor=kColorStyle;
        [self addSubview:_spearView];
        
        [self addSubview:view];
    }
    return self;
}

@end
