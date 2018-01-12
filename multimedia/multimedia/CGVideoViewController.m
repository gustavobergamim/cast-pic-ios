//
//  CGVideoViewController.m
//  multimedia
//
//  Created by Gustavo Bergamim on 09/01/18.
//  Copyright © 2018 Cast Group. All rights reserved.
//

#import "CGVideoViewController.h"
#import "CGVideoUtils.h"

@interface CGVideoViewController ()

@property (weak, nonatomic) IBOutlet UIView *videoView;
@property (nonatomic, strong) CGVideoUtils *videoUtils;

@end

@implementation CGVideoViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    self.videoUtils = [[CGVideoUtils alloc] init];
}

- (void) didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) playPause:(UIButton *)sender {
//    [self.videoUtils playURL:[NSURL URLWithString:@"http://www.livroiphone.com.br/carros/luxo/bugatti_veyron.mp4"] withView:self.videoView inViewController:self];
    [self.videoUtils playFile:@"bugatti_veyron.mp4" withView:self.videoView inViewController:self];
}

- (IBAction) stop:(UIButton *)sender {
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
