//
//  SoundUtils.h
//  multimedia
//
//  Created by Gustavo Bergamim on 09/01/18.
//  Copyright © 2018 Cast Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <AVFoundation/AVFoundation.h>

@interface CGSoundUtils : NSObject<AVAudioPlayerDelegate>

- (void) playFile:(NSString*)arquivo;
- (void) playUrl:(NSURL*)url;
- (void) pause;
- (void) stop;

@end
