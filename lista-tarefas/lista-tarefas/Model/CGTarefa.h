//
//  CGTarefa.h
//  lista-tarefas
//
//  Created by Gustavo Bergamim on 14/12/2017.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CGTarefa : NSObject<NSCoding>

@property (nonatomic, strong) NSString *nome;
@property (nonatomic, strong) NSDate *data;

@end
