//
//  UIImage+Rotate_Flip.h
//  BigMouse
//
//  Created by ARIST on 15/9/15.
//  Copyright (c) 2015年 深圳市葵花子科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Rotate_Flip)

/*
 * @brief rotate image 90 withClockWise
 */
- (UIImage*)rotate90Clockwise;

/*
 * @brief rotate image 90 counterClockwise
 */
- (UIImage*)rotate90CounterClockwise;

/*
 * @brief rotate image 180 degree
 */
- (UIImage*)rotate180;

/*
 * @brief rotate image to default orientation
 */
- (UIImage*)rotateImageToOrientationUp;

/*
 * @brief flip horizontal
 */
- (UIImage*)flipHorizontal;

/*
 * @brief flip vertical
 */
- (UIImage*)flipVertical;

/*
 * @brief flip horizontal and vertical
 */
- (UIImage*)flipAll;


@end
