//
//  CGVideoUtils.m
//  multimedia
//
//  Created by Gustavo Bergamim on 09/01/18.
//  Copyright © 2018 Cast Group. All rights reserved.
//

#import "CGVideoUtils.h"

@implementation CGVideoUtils
{
    AVPlayerViewController *_playerController;
}

- (void) playFile:(NSString *)file withView:(UIView *)view inViewController:(UIViewController*)viewController
{
    
    NSString *path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:file];
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"bugatti_veyron" ofType:@"mp4"];
    if (path)
    {
        NSURL *url = [NSURL fileURLWithPath:path];
        NSLog(@"URL %@", url);
        [self playURL:url withView:view inViewController:viewController];
    }
}

- (void) playURL:(NSURL *)url withView:(UIView *)view inViewController:(UIViewController*)viewController
{
    @try
    {
        if (!_playerController)
        {
            AVPlayer *player = [AVPlayer playerWithURL:url];
            _playerController = [[AVPlayerViewController alloc] init];
            [_playerController setPlayer:player];
//            [_player play];
            
//            [_playerController.view setFrame:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)];
            [_playerController.view setFrame:view.bounds];
            
//            [viewController addChildViewController:controller];
            [view addSubview:_playerController.view];
            
        }
        [_playerController.player play];
        
    }
    @catch (NSException *exception)
    {
        NSLog(@"Erro: %@", [exception description]);
    }
}


- (void) playFileFullScreen:(NSString *)file withView:(UIViewController *)viewController
{
    NSString *path = [[NSBundle mainBundle] pathForResource:file ofType:nil];
    if (path)
    {
        NSURL *url = [NSURL fileURLWithPath:path];
        NSLog(@"URL %@", url);
        [self playURLFullScreen:url withView:viewController];
    }
}

- (void) playURLFullScreen:(NSURL *)url withView:(UIViewController *)viewController
{
    
}

- (void) pause
{
    
}

- (void) stop
{
    
}

@end
