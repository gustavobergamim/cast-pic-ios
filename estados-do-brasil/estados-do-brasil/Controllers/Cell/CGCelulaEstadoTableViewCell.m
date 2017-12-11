//
//  CGCelulaEstadoTableViewCell.m
//  estados-do-brasil
//
//  Created by Gustavo Bergamim on 06/12/2017.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "CGCelulaEstadoTableViewCell.h"

@implementation CGCelulaEstadoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)preencher:(CGEstado *)estado
{
    self.imagemBandeira.image = [UIImage imageNamed:[estado obterNomeImagemBandeira]];
    self.labelEstado.text = estado.nome;
    self.labelCapital.text = estado.capital;
}

@end
