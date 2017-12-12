//
//  CGFilmeTableViewCell.m
//  meus-filmes
//
//  Created by Gustavo Bergamim on 11/12/2017.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "CGFilmeTableViewCell.h"

@implementation CGFilmeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)preencher:(CGFilme *)filme
{
    self.imagemFilme.image = [UIImage imageNamed:[filme obterNomeImagem]];
    self.labelNome.text = filme.nome;
    self.labelDescricao.text = filme.descricao;
}

@end
