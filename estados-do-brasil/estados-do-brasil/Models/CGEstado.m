//
//  CGEstado.m
//  estados-do-brasil
//
//  Created by Gustavo Bergamim on 06/12/2017.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "CGEstado.h"

@implementation CGEstado

- (NSString *)obterNomeImagemBandeira
{
    NSData *data = [self.nome dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *nomeImagem = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    nomeImagem = [nomeImagem lowercaseString];
    nomeImagem = [nomeImagem stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    return nomeImagem;
}

- (NSString *)obterNomeRegiao
{
    return [CGEstado obterNomeRegiao:self.regiao];
}

+ (NSString *)obterNomeRegiao:(CGEnumRegiao)enumRegiao
{
    switch (enumRegiao) {
        case CGEnumRegiaoNorte:
            return @"Norte";
        case CGEnumRegiaoNordeste:
            return @"Nordeste";
        case CGEnumRegiaoCentroOeste:
            return @"Centro-Oeste";
        case CGEnumRegiaoSudeste:
            return @"Sudeste";
        case CGEnumRegiaoSul:
            return @"Sul";
        default:
            return @"";
    }
}

@end
