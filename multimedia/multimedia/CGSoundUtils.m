//
//  SoundUtils.m
//  multimedia
//
//  Created by Gustavo Bergamim on 09/01/18.
//  Copyright © 2018 Cast Group. All rights reserved.
//

#import "CGSoundUtils.h"

@implementation CGSoundUtils
{
    AVAudioPlayer *_player;
}

- (void) playFile:(NSString *)arquivo
{
    if (!_player)
    {
//        NSString *path = [[[NSBundle mainBundle] resourcePath] stringByAppendingString:@"/"];
//        path = [path stringByAppendingString:arquivo];
        NSString *path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:arquivo];
        
        //Criar a URL a partir de um arquivo
        NSURL *url = [NSURL fileURLWithPath:path];
        [self playUrl:url];
    }
    else
    {
        [_player play];
    }
}

- (void) playUrl:(NSURL *)url
{
    if (!_player)
    {
        NSLog(@"URL %@", url);
        NSError *error;
        _player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
        [_player setVolume:1.0];
        
        if (!error)
        {
            _player.delegate = self;
            [_player play];
        }
        else
        {
            NSLog(@"Erro: %@", error.localizedDescription);
        }
    }
}

- (void) pause
{
    if (_player)
    {
        NSLog(@"Pause.");
        [_player pause];
    }
}

- (void) stop
{
    if (_player)
    {
        NSLog(@"Stop.");
        [_player stop];
        [_player setCurrentTime:0];
    }
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    NSLog(@"Fim da música.");
    _player = nil;
}

@end
