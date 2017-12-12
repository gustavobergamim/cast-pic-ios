//
//  CGFilme.h
//  meus-filmes
//
//  Created by Gustavo Bergamim on 11/12/2017.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CGFilme : NSObject

@property (nonatomic, strong) NSString *nome;
@property (nonatomic, strong) NSString *descricao;

- (NSString *)obterNomeImagem;

@end
