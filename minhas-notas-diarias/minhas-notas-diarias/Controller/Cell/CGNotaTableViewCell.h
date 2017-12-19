//
//  CGNotaTableViewCell.h
//  minhas-notas-diarias
//
//  Created by Gustavo Bergamim on 18/12/17.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Nota+CoreDataProperties.h"

@interface CGNotaTableViewCell : UITableViewCell

- (void) preencher:(Nota*)nota;

@end
