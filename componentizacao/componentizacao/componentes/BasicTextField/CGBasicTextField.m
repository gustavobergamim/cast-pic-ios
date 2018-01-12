//
//  CGBasicTextField.m
//  componentizacao
//
//  Created by Gustavo Bergamim on 10/01/18.
//  Copyright © 2018 Cast Group. All rights reserved.
//

#import "CGBasicTextField.h"

@interface CGBasicTextField()

@property (nonatomic, assign) IBInspectable BOOL addBottomBorder;
@property (nonatomic, assign) IBInspectable CGFloat bottomBorderWidth;
@property (nonatomic, strong) IBInspectable UIColor *bottomBorderColor;

@end

@implementation CGBasicTextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void) drawRect:(CGRect)rect
{
    if (self.addBottomBorder)
    {
        CALayer *bottomBorder = [CALayer layer];
        [bottomBorder setBorderColor:self.bottomBorderColor.CGColor];
        [bottomBorder setFrame:CGRectMake(0, rect.size.height - self.bottomBorderWidth, rect.size.width, rect.size.height)];
        [bottomBorder setBorderWidth:self.bottomBorderWidth];
        [self.layer addSublayer:bottomBorder];
        [self.layer setMasksToBounds:YES];
    }
}

@end
