//
//  ViewController.m
//  minhas-anotacoes
//
//  Created by Gustavo Bergamim on 12/12/2017.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textAnotacoes;

@end

@implementation ViewController

static NSString *keyMinhasAnotacoes = @"minhas-anotacoes";

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *minhasAnotacoes = [[NSUserDefaults standardUserDefaults] objectForKey:keyMinhasAnotacoes];
    self.textAnotacoes.text = minhasAnotacoes;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)salvar:(UIButton *)sender {
    [[NSUserDefaults standardUserDefaults] setObject:self.textAnotacoes.text forKey:keyMinhasAnotacoes];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self.textAnotacoes resignFirstResponder];
}

@end
