//
//  CGFilmeTableViewCell.h
//  meus-filmes
//
//  Created by Gustavo Bergamim on 11/12/2017.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CGFilme.h"

@interface CGFilmeTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imagemFilme;
@property (weak, nonatomic) IBOutlet UILabel *labelNome;
@property (weak, nonatomic) IBOutlet UILabel *labelDescricao;

- (void)preencher:(CGFilme *)filme;

@end
