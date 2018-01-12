//
//  CGVideoUtils.h
//  multimedia
//
//  Created by Gustavo Bergamim on 09/01/18.
//  Copyright © 2018 Cast Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <AVKit/AVKit.h>
#include <AVFoundation/AVFoundation.h>

@interface CGVideoUtils : NSObject

- (void) playFile:(NSString*)file withView:(UIView*)view inViewController:(UIViewController*)viewController;
- (void) playURL:(NSURL*)url withView:(UIView*)view inViewController:(UIViewController*)viewController;

//- (void) playFile:(NSString*)file withView:(UIView*)view;
//- (void) playURL:(NSURL*)url withView:(UIView*)view;

//- (void) playFileFullScreen:(NSString*)file withView:(UIViewController*)viewController;
//- (void) playURLFullScreen:(NSURL*)url withView:(UIViewController*)viewController;

- (void) pause;
- (void) stop;

@end
