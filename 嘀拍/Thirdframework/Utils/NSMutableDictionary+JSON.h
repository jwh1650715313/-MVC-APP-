//
//  NSMutableDictionary+JSON.h
//  Football
//
//  Created by 赵雷 on 15/7/21.
//  Copyright (c) 2015年 wts. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (JSON)
-(NSString *)toJSON;
-(NSMutableDictionary *)byJSON:(NSString *) json;
@end
