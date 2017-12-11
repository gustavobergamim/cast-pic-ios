//
//  CGServiceEstado.h
//  estados-do-brasil
//
//  Created by Gustavo Bergamim on 06/12/2017.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CGEstado.h"

@interface CGServiceEstado : NSObject

- (NSArray<CGEstado*>*) recuperarEstados;

- (NSDictionary<NSNumber*, NSArray<CGEstado*>*>*) recuperarEstadosPorRegiao;

@end
