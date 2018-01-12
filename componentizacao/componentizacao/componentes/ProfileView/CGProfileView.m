//
//  CGProfileView.m
//  componentizacao
//
//  Created by Gustavo Bergamim on 10/01/18.
//  Copyright © 2018 Cast Group. All rights reserved.
//

#import "CGProfileView.h"

@interface CGProfileView()

@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *badgeLabel;

@end

@implementation CGProfileView

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self loadViewFromNib];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self loadViewFromNib];
    }
    return self;
}

- (void) loadViewFromNib
{
    UIView *view = [[[NSBundle bundleForClass:[self class]] loadNibNamed:NSStringFromClass(self.class) owner:self options:nil] firstObject];
    
    [view setFrame:self.bounds];
    [self addSubview:view];
    [self setBadgeValue:0];
}

- (void) drawRect:(CGRect)rect
{
//    [self.layer setCornerRadius:self.frame.size.height / 4];
    [self.layer setMasksToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
//    [self.superview setOpaque:NO];
//    [self.superview setBackgroundColor:[UIColor clearColor]];
    
    [self.profileImageView.layer setCornerRadius:self.profileImageView.frame.size.height / 4];
    [self.profileImageView.layer setMasksToBounds:YES];
    [self.profileImageView setImage:self.profileImage];
    [self.profileImageView.layer setBorderColor:[[UIColor blackColor] CGColor]];
    
    [self.badgeLabel.layer setCornerRadius:self.badgeLabel.frame.size.height / 2];
    [self.badgeLabel.layer setMasksToBounds:YES];
    [self.badgeLabel setText:[@(self.badgeValue) stringValue]];
}



@end
