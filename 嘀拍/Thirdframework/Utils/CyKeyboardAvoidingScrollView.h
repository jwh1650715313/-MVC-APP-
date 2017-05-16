//
//  TPKeyboardAvoidingScrollView.h
//
//  Created by Michael Tyson on 11/04/2011.
//  Copyright 2011 A Tasty Pixel. All rights reserved.
//

@interface CyKeyboardAvoidingScrollView : UIScrollView

// 设置是否需要点击任意地方 收起键盘 默认YES
@property (nonatomic, assign) BOOL isTapAnyHideKeyboard;
// 调整位置
- (void)adjustOffsetToIdealIfNeeded;
@end
