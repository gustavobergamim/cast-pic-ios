//
//  CGProfileView.h
//  componentizacao
//
//  Created by Gustavo Bergamim on 10/01/18.
//  Copyright © 2018 Cast Group. All rights reserved.
//
IB_DESIGNABLE
#import <UIKit/UIKit.h>

@interface CGProfileView : UIView

@property (strong, nonatomic) IBInspectable UIImage *profileImage;
@property (assign, nonatomic) IBInspectable NSInteger badgeValue;

@end
