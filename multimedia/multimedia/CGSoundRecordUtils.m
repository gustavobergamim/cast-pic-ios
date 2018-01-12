//
//  CGSoundRecordUtils.m
//  multimedia
//
//  Created by Gustavo Bergamim on 09/01/18.
//  Copyright © 2018 Cast Group. All rights reserved.
//

#import "CGSoundRecordUtils.h"

@implementation CGSoundRecordUtils
{
    AVAudioRecorder *_audioRecord;
}

- (void) record:(NSURL *)url
{
    NSError *error;
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    
    [audioSession setActive:YES error:&error];
    if (error)
    {
        [self exibirErro:error em:@"ativar sessão"];
        return;
    }
    
    [audioSession setCategory:AVAudioSessionCategoryPlayAndRecord withOptions:AVAudioSessionCategoryOptionDefaultToSpeaker error:&error];
    if (error)
    {
        [self exibirErro:error em:@"atribuir categoria"];
        return;
    }
    _audioRecord = [[AVAudioRecorder alloc] initWithURL:url settings:@{} error:&error];
    if (error)
    {
        [self exibirErro:error em:@"iniciar gravação"];
        return;
    }
    _audioRecord.delegate = self;
    [_audioRecord prepareToRecord];
    [_audioRecord record];
}

- (void) exibirErro:(NSError*)error em:(NSString*)contexto
{
    NSLog(@"Erro [%@]: %@", contexto, error.localizedDescription);
}

- (void) stop
{
    NSLog(@"Stop.");
    [_audioRecord stop];
}

- (void) audioRecorderDidFinishRecording:(AVAudioRecorder *)recorder successfully:(BOOL)flag
{
    NSLog(@"Fim da gravação, sucesso: %@", flag ? @"sim": @"não");
}

@end
