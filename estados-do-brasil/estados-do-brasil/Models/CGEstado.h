//
//  CGEstado.h
//  estados-do-brasil
//
//  Created by Gustavo Bergamim on 06/12/2017.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, CGEnumRegiao)
{
    CGEnumRegiaoNorte,
    CGEnumRegiaoNordeste,
    CGEnumRegiaoSul,
    CGEnumRegiaoSudeste,
    CGEnumRegiaoCentroOeste
};

@interface CGEstado : NSObject

@property (nonatomic, strong) NSString *nome;
@property (nonatomic, strong) NSString *capital;
@property (nonatomic, strong) NSString *sigla;
@property (nonatomic, assign) CGEnumRegiao regiao;

@end
