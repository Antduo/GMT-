//
//  NSString+time.m
//  GMT
//
//  Created by Saltedfish on 2017/11/28.
//  Copyright © 2017年 物联利浪. All rights reserved.
//

#import "NSString+time.h"

@implementation NSString (time)

- (NSString *)ll_getNowDateFromatAnDateWithFormat:(NSString *)format
{
    NSDate *date = [self ll_isNumber] ? [self ll_dealTimeIntervalToDate] : [self ll_dealStringToDateWithFormat:format];

    return [self ll_getLocalDateWithDate:date format:format];
}

- (NSDate *)ll_dealTimeIntervalToDate
{
    NSTimeInterval time=[self doubleValue]/1000;
    return [NSDate dateWithTimeIntervalSince1970:time];
}

- (NSDate *)ll_dealStringToDateWithFormat:(NSString *)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];

    return [dateFormatter dateFromString:self];
}

- (NSString *)ll_getLocalDateWithDate:(NSDate *)date format:(NSString *)format {
    //设置源日期时区
    NSTimeZone* sourceTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
    //设置转换后的目标日期时区
    NSTimeZone* destinationTimeZone = [NSTimeZone localTimeZone];
    //得到源日期与世界标准时间的偏移量
    NSInteger sourceGMTOffset = [sourceTimeZone secondsFromGMTForDate:date];
    //目标日期与本地时区的偏移量
    NSInteger destinationGMTOffset = [destinationTimeZone secondsFromGMTForDate:date];
    //得到时间偏移量的差值
    NSTimeInterval interval = destinationGMTOffset - sourceGMTOffset;
    //转为现在时间
    NSDate* destinationDateNow = [[NSDate alloc] initWithTimeInterval:interval sinceDate:date];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSString *currentDateStr = [dateFormatter stringFromDate: destinationDateNow];
    
    return currentDateStr;
}


- (BOOL)ll_isNumber {
    if (self.length == 0) {
        return NO;
    }
    
    NSString *regex =@"[0-9]*";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [pred evaluateWithObject:self];
}


@end
