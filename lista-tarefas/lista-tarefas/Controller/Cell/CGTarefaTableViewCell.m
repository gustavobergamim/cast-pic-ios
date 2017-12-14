//
//  CGTarefaTableViewCell.m
//  lista-tarefas
//
//  Created by Gustavo Bergamim on 14/12/2017.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "CGTarefaTableViewCell.h"

@implementation CGTarefaTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void) preencher:(CGTarefa*)tarefa
{
    self.textLabel.text = tarefa.nome;
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"dd/MM/yyyy HH:mm"];
    self.detailTextLabel.text = [formatter stringFromDate:tarefa.data];
}

@end
