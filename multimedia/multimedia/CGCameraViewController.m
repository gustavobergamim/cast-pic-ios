//
//  CGCameraViewController.m
//  multimedia
//
//  Created by Gustavo Bergamim on 08/01/18.
//  Copyright © 2018 Cast Group. All rights reserved.
//

#import "CGCameraViewController.h"
#include <AVFoundation/AVFoundation.h>
#include <Photos/PHPhotoLibrary.h>

@interface CGCameraViewController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imagem;
@property (nonatomic, strong) UIImagePickerController *imagePicker;

@end

@implementation CGCameraViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imagePicker = [[UIImagePickerController alloc] init];
    self.imagePicker.delegate = self;
    self.imagePicker.allowsEditing = YES;
    BOOL isCameraDisponivel = [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
    
    if (!isCameraDisponivel)
    {
        NSLog(@"Câmera indisponível para este dispositivo.");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) verificarAcessoCamera
{
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    switch (status) {
        case AVAuthorizationStatusNotDetermined:
            [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                if (granted)
                {
                    NSLog(@"Acesso permitido.");
                }
                else
                {
                    NSLog(@"Acesso negado.");
                }
            }];
            break;
        case AVAuthorizationStatusRestricted:
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]
                                               options:@{} completionHandler:nil];
            break;
        case AVAuthorizationStatusDenied:
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]
                                               options:@{} completionHandler:nil];
            break;
        case AVAuthorizationStatusAuthorized:
            break;
        default:
            break;
    }
}

- (void) verificarAcessoAlbum
{
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    switch (status) {
        case PHAuthorizationStatusNotDetermined:
            [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
                if (status == PHAuthorizationStatusAuthorized)
                {
                    NSLog(@"Acesso permitido.");
                }
                else
                {
                    NSLog(@"Acesso negado.");
                }
            }];
            break;
        case PHAuthorizationStatusRestricted:
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]
                                               options:@{} completionHandler:nil];
            break;
        case PHAuthorizationStatusDenied:
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]
                                               options:@{} completionHandler:nil];
            break;
        case PHAuthorizationStatusAuthorized:
            break;
        default:
            break;
    }
}

- (IBAction) escolherFoto:(UIButton *)sender
{
    //[self verificarAcessoAlbum];
    self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:self.imagePicker animated:YES completion:nil];
}

- (IBAction) capturarImagem:(UIButton *)sender
{
    //[self verificarAcessoCamera];
    self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:self.imagePicker animated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark UIImagePickerControllerDelegate

- (void) imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *imagem = info[UIImagePickerControllerEditedImage];
    self.imagem.image = imagem;
    [self imagePickerControllerDidCancel:picker];
}

@end
