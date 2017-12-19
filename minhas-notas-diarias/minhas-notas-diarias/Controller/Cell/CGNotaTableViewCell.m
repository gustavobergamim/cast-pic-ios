//
//  CGNotaTableViewCell.m
//  minhas-notas-diarias
//
//  Created by Gustavo Bergamim on 18/12/17.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "CGNotaTableViewCell.h"
#import "NSDate+CGDate.h"

@implementation CGNotaTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void) preencher:(Nota *)nota
{
    self.textLabel.text = nota.conteudo;
    self.detailTextLabel.text = [NSDate toDateTimeString:nota.dataUltimaAlteracao];
}

@end
