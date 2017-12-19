//
//  NSDate+CGDate.m
//  core-data-stack
//
//  Created by Gustavo Bergamim on 15/12/17.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "NSDate+CGDate.h"

@implementation NSDate (CGDate)

+ (NSDate *)dateFromYear:(int)year month:(int)month day:(int)day
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setYear:year];
    [components setMonth:month];
    [components setDay:day];
    return [calendar dateFromComponents:components];
}

+ (NSString *)toDateTimeString:(NSDate *)data
{
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"dd/MM/yyyy HH:mm"];
    return [formatter stringFromDate:data];
}

@end
