//
//  CGTarefa.m
//  lista-tarefas
//
//  Created by Gustavo Bergamim on 14/12/2017.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "CGTarefa.h"

@implementation CGTarefa

- (instancetype) init
{
    self.data = [NSDate date];
    return self;
}

- (instancetype) initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init])
    {
        self.nome = [aDecoder decodeObjectForKey:@"nome"];
        self.data = [aDecoder decodeObjectForKey:@"data"];
    }
    return self;
}

- (void) encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.nome forKey:@"nome"];
    [aCoder encodeObject:self.data forKey:@"data"];
}

- (BOOL)isEqual:(id)object
{
    if (!object) return NO;
    
    if (![object isKindOfClass:[CGTarefa class]]) return NO;
    
    CGTarefa *tarefa = (CGTarefa*)object;
    return tarefa.nome == self.nome
        && [tarefa.data compare:self.data] == NSOrderedSame;
}

@end
