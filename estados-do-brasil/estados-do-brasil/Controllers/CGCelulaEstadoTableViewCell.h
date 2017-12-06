//
//  CGCelulaEstadoTableViewCell.h
//  estados-do-brasil
//
//  Created by Gustavo Bergamim on 06/12/2017.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CGCelulaEstadoTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imagemBandeira;
@property (weak, nonatomic) IBOutlet UILabel *labelEstado;
@property (weak, nonatomic) IBOutlet UILabel *labelCapital;

@end
