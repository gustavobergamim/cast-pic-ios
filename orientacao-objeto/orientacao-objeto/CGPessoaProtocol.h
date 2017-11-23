//
//  CGPessoaProtocol.h
//  orientacao-objeto
//
//  Created by Gustavo Bergamim on 23/11/2017.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CGPessoaProtocol <NSObject>

- (void) andar;
- (void) correr;

@optional
- (void) nadar;

@end
