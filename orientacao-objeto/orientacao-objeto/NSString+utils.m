//
//  NSString+utils.m
//  orientacao-objeto
//
//  Created by Gustavo Bergamim on 23/11/2017.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "NSString+utils.h"

@implementation NSString (utils)

- (NSString *) trim
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

- (NSString *) concate:(NSString *)var1
{
    return [self stringByAppendingString: var1];
}

@end
