//
//  CGDetalhesViewController.m
//  cara-coroa
//
//  Created by Cast Group on 05/12/17.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "CGDetalhesViewController.h"

@interface CGDetalhesViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imagemMoeda;

@end

@implementation CGDetalhesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if(self.caraCoroa == 0)
    {
        self.imagemMoeda.image = [UIImage imageNamed:@"moeda_coroa"];
    }
    else
    {
        self.imagemMoeda.image = [UIImage imageNamed:@"moeda_cara"];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)voltar:(UIButton *)sender {
    if(self.navigationController  != nil)
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
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
