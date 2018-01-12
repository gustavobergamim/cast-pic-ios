//
//  CGAudioViewController.m
//  multimedia
//
//  Created by Gustavo Bergamim on 09/01/18.
//  Copyright © 2018 Cast Group. All rights reserved.
//

#import "CGAudioViewController.h"
#import "CGSoundUtils.h"
#import "CGSoundRecordUtils.h"

@interface CGAudioViewController ()
{
    NSURL *_recordURL;
}

@property (nonatomic, strong) CGSoundUtils *musicPlayer;
@property (nonatomic, strong) CGSoundUtils *audioPlayer;
@property (nonatomic, strong) CGSoundRecordUtils *audioRecorder;

@end

@implementation CGAudioViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.musicPlayer = [[CGSoundUtils alloc] init];
    self.audioPlayer = [[CGSoundUtils alloc] init];
    self.audioRecorder = [[CGSoundRecordUtils alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) playMusic:(UIButton *)sender
{
    [self.musicPlayer playFile:@"thai.mp3"];
}

- (IBAction) pauseMusic:(UIButton *)sender
{
    [self.musicPlayer pause];
}

- (IBAction) stopMusic:(UIButton *)sender
{
    [self.musicPlayer stop];
}

- (IBAction) recordAudio:(UIButton *)sender
{
    NSString *tempDir = NSTemporaryDirectory();
    NSString *path = [tempDir stringByAppendingString:@"mamaeUrso.caf"];
    _recordURL = [NSURL fileURLWithPath:path];
    [self.audioRecorder record:_recordURL];
}
- (IBAction) stopAudioRecording:(UIButton *)sender {
    [self.audioRecorder stop];
}

- (IBAction) playAudio:(UIButton *)sender
{
    if (_recordURL)
    {
        [self.audioPlayer playUrl:_recordURL];
    }
}

- (IBAction) pauseAudio:(UIButton *)sender
{
    [self.audioPlayer pause];
}

- (IBAction) stopAudio:(UIButton *)sender
{
    [self.audioPlayer stop];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
