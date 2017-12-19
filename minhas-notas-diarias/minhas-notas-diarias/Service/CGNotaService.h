//
//  CGNotaService.h
//  minhas-notas-diarias
//
//  Created by Gustavo Bergamim on 18/12/17.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Nota+CoreDataProperties.h"

@interface CGNotaService : NSObject

- (NSArray<Nota*>*) listarNotas;

- (void) remover:(Nota*)nota;

- (void) adicionar:(NSString*)conteudo;

- (void) alterar:(Nota*)nota;

@end
