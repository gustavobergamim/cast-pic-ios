//
//  Urso.h
//  helloworld
//
//  Created by Gustavo Bergamim on 14/11/2017.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Urso : NSObject

/*
 nonatomic: o iOS não precisa se preocupar com concorrência
 no uso desta variável, visto que o iOS não é multithread.
 
 strong: o compilador deve ter o cuidado de verificar o
 uso desta variável para controlar o uso de memória.
 
 weak: o valor pode ser removido da memória e o compilador
 não precisa validar o seu uso no código.
 */
@property (nonatomic, strong, setter=definirPeso:, getter=obterPeso) NSNumber *peso;

@end
