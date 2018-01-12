//
//  ViewController.m
//  som-dos-bichos
//
//  Created by Gustavo Bergamim on 10/01/18.
//  Copyright © 2018 Cast Group. All rights reserved.
//

#import "ViewController.h"
#import "CGSoundUtils.h"

@interface ViewController ()

@property (nonatomic, strong) CGSoundUtils *soundPlayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.soundPlayer = [[CGSoundUtils alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tocarSom:(UIButton *)sender {
    NSString *arquivo = [NSString stringWithFormat:@"%@.mp3", sender.restorationIdentifier];
    [self.soundPlayer playFile:arquivo];
}

@end
