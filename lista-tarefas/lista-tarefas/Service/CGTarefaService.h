//
//  CGTarefaService.h
//  lista-tarefas
//
//  Created by Gustavo Bergamim on 13/12/2017.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CGTarefaService : NSObject

- (NSArray<NSString*>*) recuperarTarefas;
- (void) adicionarTarefa:(NSString *) tarefa;
- (void) removerTarefa:(NSString *) tarefa;

@end
