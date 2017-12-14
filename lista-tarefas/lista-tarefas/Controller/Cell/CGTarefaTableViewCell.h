//
//  CGTarefaTableViewCell.h
//  lista-tarefas
//
//  Created by Gustavo Bergamim on 14/12/2017.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CGTarefa.h"

@interface CGTarefaTableViewCell : UITableViewCell

- (void) preencher:(CGTarefa*)tarefa;

@end
