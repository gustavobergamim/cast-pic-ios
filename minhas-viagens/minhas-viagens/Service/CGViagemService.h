//
//  CGViagemService.h
//  minhas-viagens
//
//  Created by Gustavo Bergamim on 20/12/17.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Viagem+CoreDataProperties.h"

@interface CGViagemService : NSObject

- (NSArray<Viagem*>*) listar;

- (void) salvarViagemPara:(NSString*)local latitude:(double)latitude longitude:(double)longitude;

- (void) remover:(Viagem*)viagem;

@end
