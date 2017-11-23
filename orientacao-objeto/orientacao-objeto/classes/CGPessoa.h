//
//  CGPessoa.h
//  orientacao-objeto
//
//  Created by Gustavo Bergamim on 23/11/2017.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CGPessoaProtocol.h"

@interface CGPessoa : NSObject<CGPessoaProtocol>

@property (nonatomic, strong) NSString *nome;
@property (nonatomic, strong, readonly) NSString *sobrenome;

- (instancetype) initComNome:(NSString*)nome sobrenome: (NSString*)sobreNome;

- (instancetype) init __attribute__ ((unavaible("init not available")));

- (void) atribuirNome:(NSString *)nome sobrenome:(NSString*) param;

- (NSString *) nomeClasse;

@end
