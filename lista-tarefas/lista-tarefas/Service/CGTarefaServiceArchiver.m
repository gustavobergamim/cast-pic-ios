//
//  CGTarefaServiceArchiver.m
//  lista-tarefas
//
//  Created by Gustavo Bergamim on 14/12/2017.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "CGTarefaServiceArchiver.h"

@implementation CGTarefaServiceArchiver

static NSString *keyListaTarefas = @"lista-tarefas-archive";

- (NSUserDefaults*) userDefaults
{
    return [NSUserDefaults standardUserDefaults];
}

- (NSArray<NSData*>*) converterParaData:(NSArray<CGTarefa*>*)tarefas
{
    NSMutableArray<NSData*> *dataArray = [NSMutableArray arrayWithCapacity:tarefas.count];
    for (CGTarefa *tarefa in tarefas) {
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:tarefa];
        [dataArray addObject:data];
    }
    return dataArray;
}

- (NSArray<CGTarefa*>*) converterParaTarefa:(NSArray<NSData*>*)dataArray
{
    NSMutableArray<CGTarefa*> *tarefas = [NSMutableArray arrayWithCapacity:dataArray.count];
    for (NSData *data in dataArray) {
        CGTarefa *tarefa = (CGTarefa*) [NSKeyedUnarchiver unarchiveObjectWithData:data];
        [tarefas addObject:tarefa];
    }
    return tarefas;
}

- (void) salvarDataArray:(NSArray<NSData*>*)dataArray
{
    [[self userDefaults] setObject:dataArray forKey:keyListaTarefas];
    [[self userDefaults] synchronize];
}

- (void) salvarTarefas:(NSArray<CGTarefa*>*)tarefas
{
    NSArray<NSData*> *dataArray = [self converterParaData:tarefas];
    [self salvarDataArray:dataArray];
}

- (NSArray<CGTarefa*>*) recuperarTarefas
{
    NSArray<NSData*> *dataArray = [[self userDefaults] objectForKey:keyListaTarefas];
    if (!dataArray)
    {
        dataArray = @[];
        [self salvarDataArray:dataArray];
    }
    NSArray<CGTarefa*> *tarefas = [self converterParaTarefa:dataArray];
    return tarefas;
}

- (NSMutableArray<CGTarefa *> *) recuperarTarefasEdicao
{
    return [[self recuperarTarefas] mutableCopy];
}

- (void) adicionarTarefa:(CGTarefa *)tarefa
{
    NSMutableArray<CGTarefa *> *lista = [self recuperarTarefasEdicao];
    [lista addObject:tarefa];
    [self salvarTarefas:lista];
}

- (void) removerTarefa:(CGTarefa *)tarefa
{
    NSMutableArray<CGTarefa *> *lista = [self recuperarTarefasEdicao];
    [lista removeObject:tarefa];
    [self salvarTarefas:lista];
}

@end
