//
//  CGTarefaServiceArchiver.h
//  lista-tarefas
//
//  Created by Gustavo Bergamim on 14/12/2017.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CGTarefa.h"

@interface CGTarefaServiceArchiver : NSObject

- (NSArray<CGTarefa*>*) recuperarTarefas;
- (void) adicionarTarefa:(CGTarefa *) tarefa;
- (void) removerTarefa:(CGTarefa *) tarefa;

@end
