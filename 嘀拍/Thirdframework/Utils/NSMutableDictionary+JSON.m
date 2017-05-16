//
//  NSMutableDictionary+JSON.m
//  Football
//
//  Created by 赵雷 on 15/7/21.
//  Copyright (c) 2015年 wts. All rights reserved.
//

#import "NSMutableDictionary+JSON.h"

@implementation NSMutableDictionary (JSON)
-(NSString *)toJSON{
    NSString *json = nil;
    
    
    if ([NSJSONSerialization isValidJSONObject:self])
    {
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
        json =[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        
        //NSLog(@"json data:%@",json);
    }
    
    return  json;
}

-(NSMutableDictionary *)byJSON:(NSString *) json{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithCapacity:0];
    
    NSError *error;
    dict = [NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:&error];
    
    return dict;

}
@end
