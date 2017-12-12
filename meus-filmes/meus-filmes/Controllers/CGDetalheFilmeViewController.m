//
//  CGDetalheFilmeViewController.m
//  meus-filmes
//
//  Created by Gustavo Bergamim on 11/12/2017.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "CGDetalheFilmeViewController.h"

@interface CGDetalheFilmeViewController ()

@end

@implementation CGDetalheFilmeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imagem.image = [UIImage imageNamed:[self.filme obterNomeImagem]];
    self.labelNome.text = self.filme.nome;
    self.textDescricao.text = self.filme.descricao;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
