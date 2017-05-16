//
//  ViewHint.h
//  BigMouse
//
//  Created by ARIST on 15/10/18.
//  Copyright © 2015年 深圳市葵花子科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kViewHintHeight 170

@interface ViewHint : UIView

- (instancetype)initWithFrame:(CGRect)frame hintImage:(NSString *)hintImage hintText:(NSString *)hintText;

@end
