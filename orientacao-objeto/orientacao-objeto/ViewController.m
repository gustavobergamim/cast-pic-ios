//
//  ViewController.m
//  orientacao-objeto
//
//  Created by Gustavo Bergamim on 23/11/2017.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "ViewController.h"
#import "CGPessoa.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGPessoa *pessoa = [[CGPessoa alloc] init];
    
    NSLog(@"%@", [pessoa nomeClasse]);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
