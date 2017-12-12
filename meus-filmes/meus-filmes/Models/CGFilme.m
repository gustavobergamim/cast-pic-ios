//
//  CGFilme.m
//  meus-filmes
//
//  Created by Gustavo Bergamim on 11/12/2017.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "CGFilme.h"

@implementation CGFilme

- (NSString *)obterNomeImagem
{
    return [[self.nome stringByReplacingOccurrencesOfString:@" " withString:@""] lowercaseString];
}

@end
