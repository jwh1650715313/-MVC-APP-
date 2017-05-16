//
//  CommonUtils.h
//  Woyanyan
//
//  Created by ZH_ZZ_MAC on 13-12-11.
//  Copyright (c) 2013年 clyde. All rights reserved.
//

#import <Foundation/Foundation.h>


#import <Security/Security.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>


@interface CommonUtils : NSObject

// 检查网络状态
+ (BOOL)checkNet;

/**
 * 获取设备MAC地址
 */
+ (NSString *)getMacAddress;

+ (NSString *)getTelNumber;

+ (NSString *)getUrl:(NSDictionary *)dic key:(NSString *)key;

+ (NSString *)getDicStr:(NSDictionary *)dic key:(NSString *)key;

+ (NSDictionary *)getDicFromString:(NSString *)str;

+ (float)getSystemOSVersion;

+ (float)getTextHeight:(NSString *)text width:(float)width font:(UIFont *)font;

+ (float)getTextWidth:(NSString *)text width:(float)width font:(UIFont *)font;

+ (UIImage *)grayscale:(UIImage *)anImage type:(char)type;

+ (UIImage *)imageFromColor:(UIColor *)color;

+ (NSString *)stringFromMillSec:(NSString *)timeStr;

+ (NSString *)stringYYYYMMddHHmmFromMillSec:(NSString *)timeStr;

+ (NSString *)stringYYYYMMddFromMillSec:(NSString *)timeStr;
// date 格式化为 string
+ (NSString*) stringFromFomate:(NSDate*)date formate:(NSString*)formate;

+ (NSString *)stringFromMillSec1:(NSString *)timeStr;

+ (NSString *) dateMMddFromFomate:(NSString *)datestring formate:(NSString*)formate;

+ (NSString *) dateHHmmFromFomate:(NSString *)datestring formate:(NSString*)formate;

+ (NSString *) dateMMddHHmmFromFomate:(NSString *)datestring formate:(NSString*)formate;

+ (NSString *) dateYYMMddHHmmFromFomate:(NSString *)datestring formate:(NSString*)formate;



+ (BOOL)checkPhone:(NSString *)phone;


+ (NSString *)getDistanceString:(Float64)distance;

+ (NSString *)getTimePassString:(int32_t)timePass;

//+ (BOOL)checkNeedLogin;//是否需要登录


// 获取中文
+ (NSInteger)getStringLengthWithChinese:(NSString *)str;



+ (NSString*)getPhoneDeviceId;//手机的唯一标示

//生成签名
+ (NSString*)creatSign:(NSMutableArray*)keyArray dic:(NSMutableDictionary*)dic;



////缓存登录信息
//+(void)SaveLoginInfo:(LoginInfo *)info;
//
//+(LoginInfo *)getLoginInfo;



//判断字符串是否正常
+(BOOL)IsOkString:(NSString *)str;


//判断字典是否正常
+(BOOL)IsOkNSDictionary:(NSDictionary *)dic;

//判断数组是否正常
+(BOOL)IsOkNSArray:(NSArray *)array;


//判断用户是否开启推送
+ (BOOL)isAllowedNotification;



@end
