//
//  CGSoundRecordUtils.h
//  multimedia
//
//  Created by Gustavo Bergamim on 09/01/18.
//  Copyright © 2018 Cast Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <AVFoundation/AVFoundation.h>

@interface CGSoundRecordUtils : NSObject<AVAudioRecorderDelegate>

- (void) record:(NSURL*)url;
- (void) stop;

@end
