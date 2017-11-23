//
//  CGPessoa.m
//  orientacao-objeto
//
//  Created by Gustavo Bergamim on 23/11/2017.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "CGPessoa.h"

@implementation CGPessoa

@synthesize sobrenome = _sobrenome;

#pragma mark - construtor
- (instancetype) init{
    return self;
}

- (instancetype) initComNome:(NSString *)nome sobrenome:(NSString *)sobreNome
{
    self.nome = nome;
    _sobrenome = sobreNome; //synthesize
    return self;
}

#pragma mark - propertys
- (void) setNome:(NSString *)nome
{
    _nome =nome;
}


- (void) atribuirNome:(NSString *)nome sobrenome:(NSString*)param
{
    self.nome = nome;
    _sobrenome =  param; //synthesize
}

- (NSString *) nomeClasse
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    return NSStringFromClass([self class]);
}

- (void)andar {
    
}

- (void)correr {
    
}

@end
