//
//  Date.h
//  云图
//
//  Created by vehisen Mac on 16/6/15.
//  Copyright © 2016年 com.yuntumind. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Date : NSObject

+ (NSString*)getCurrentTime_HMS;
+ (NSString *)getCurrentData_YMD;
+ (NSString *)getCurrentData_YMD1;
+ (NSMutableArray *)getMonthDataArray:(int)day;
+ (NSMutableArray *)getWeekhDataArray;
+ (NSArray *)getWeekDayArray;//获取周一到周末每天的时间
+ (NSMutableArray *)getWeekhDataArray_yy;
+ (NSMutableArray *)getWeekhDataArray_mm;
+ (NSString*)getChangeTime:(long)time ;
+ (NSString*)getChangeTime1:(int)time ;

+ (NSString *)getDataMonth;
+ (NSString *)getDataToday;
+ (NSString *)getData7;
+ (NSString *)getData30;
+ (NSString *)getData90;

+ (BOOL)isStr:(NSString*)str;

//四舍5入
+ (NSString *) decimalwithFormat:(NSString *)format  floatV:(float)floatV;
@end
