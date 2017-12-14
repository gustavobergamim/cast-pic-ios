//
//  CGTarefaService.m
//  lista-tarefas
//
//  Created by Gustavo Bergamim on 13/12/2017.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "CGTarefaService.h"

@implementation CGTarefaService

static NSString *keyListaTarefas = @"lista-tarefas";

- (NSUserDefaults*) userDefaults
{
    return [NSUserDefaults standardUserDefaults];
}

- (void) salvarArray:(NSArray*)array
{
    [[self userDefaults] setObject:array forKey:keyListaTarefas];
    [[self userDefaults] synchronize];
}

- (NSArray<NSString *> *) recuperarTarefas
{
    NSArray *array = [[self userDefaults] objectForKey:keyListaTarefas];
    if (!array)
    {
        array = @[];
        [self salvarArray:array];
    }
    return array;
}

- (NSMutableArray<NSString *> *) recuperarTarefasEdicao
{
    return [[self recuperarTarefas] mutableCopy];
}

- (void) adicionarTarefa:(NSString *)tarefa
{
    NSMutableArray<NSString *> *lista = [self recuperarTarefasEdicao];
    [lista addObject:tarefa];
    [self salvarArray:lista];
}

- (void) removerTarefa:(NSString *)tarefa
{
    NSMutableArray<NSString *> *lista = [self recuperarTarefasEdicao];
    [lista removeObject:tarefa];
    [self salvarArray:lista];
}

@end
