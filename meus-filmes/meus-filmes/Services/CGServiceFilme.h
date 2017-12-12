//
//  CGServiceFilme.h
//  meus-filmes
//
//  Created by Gustavo Bergamim on 11/12/2017.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CGFilme.h"

@interface CGServiceFilme : NSObject

- (NSArray<CGFilme*>*) recuperarFilmes;

@end
