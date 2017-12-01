//
//  NSString+ext.m
//  GMT
//
//  Created by Saltedfish on 2017/11/28.
//  Copyright © 2017年 物联利浪. All rights reserved.
//

#import "NSString+ext.h"

@implementation NSString (ext)


//UTC
- (NSString *)ll_timeArrangeWithStr:(NSString *)strTime{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZ"];
    NSDate *date = [dateFormatter dateFromString:strTime];
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSString * str = [dateFormatter stringFromDate:date];
    
    return str;
}

@end
