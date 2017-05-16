//
//  ViewHint.m
//  BigMouse
//
//  Created by ARIST on 15/10/18.
//  Copyright © 2015年 深圳市葵花子科技有限公司. All rights reserved.
//

#import "ViewHint.h"

@implementation ViewHint

- (instancetype)initWithFrame:(CGRect)frame hintImage:(NSString *)hintImage hintText:(NSString *)hintText
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *image1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 40, frame.size.width, 90)];
        image1.backgroundColor = [UIColor clearColor];
        image1.contentMode = UIViewContentModeScaleAspectFit;
        image1.image = [UIImage imageNamed:hintImage];
        [self addSubview:image1];
        
        UILabel  *image2 = [[UILabel alloc] initWithFrame:CGRectMake(0, image1.bottom+10, frame.size.width, 15)];
        image2.backgroundColor = [UIColor clearColor];
        image2.textAlignment = NSTextAlignmentCenter;
        image2.text=hintText;
        image2.numberOfLines=0;
        image2.textColor=kCyColorFromHex(0xc8c8c8);
        [image2 setFont:[UIFont systemFontOfSize:12.f]];
        [self addSubview:image2];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
