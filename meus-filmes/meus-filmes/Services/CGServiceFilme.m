//
//  CGServiceFilme.m
//  meus-filmes
//
//  Created by Gustavo Bergamim on 11/12/2017.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "CGServiceFilme.h"


@implementation CGServiceFilme

- (NSArray<CGFilme *> *)recuperarFilmes
{
    NSMutableArray *arrayFilmes = [@[] mutableCopy];
    for (int index = 1; index <= 10; index++) {
        CGFilme *filme = [CGFilme new];
        [filme setNome:[NSString stringWithFormat:@"Filme %d", index]];
        [filme setDescricao:[NSString stringWithFormat:@"Descrição do filme %d", index]];
        [arrayFilmes addObject:filme];
    }
    return arrayFilmes;
}

@end
