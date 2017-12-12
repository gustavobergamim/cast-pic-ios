//
//  CGDetalheFilmeViewController.h
//  meus-filmes
//
//  Created by Gustavo Bergamim on 11/12/2017.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CGFilme.h"

@interface CGDetalheFilmeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imagem;
@property (weak, nonatomic) IBOutlet UILabel *labelNome;
@property (weak, nonatomic) IBOutlet UITextView *textDescricao;

@property(nonatomic, strong) CGFilme *filme;

@end
