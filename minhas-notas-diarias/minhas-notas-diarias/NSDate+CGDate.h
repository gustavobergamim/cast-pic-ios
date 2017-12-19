//
//  NSDate+CGDate.h
//  core-data-stack
//
//  Created by Gustavo Bergamim on 15/12/17.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (CGDate)

+ (NSDate*) dateFromYear:(int)year month:(int)month  day:(int)day;

+ (NSString *)toDateTimeString:(NSDate *)data;

@end
