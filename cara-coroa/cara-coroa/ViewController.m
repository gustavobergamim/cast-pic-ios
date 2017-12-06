//
//  ViewController.m
//  cara-coroa
//
//  Created by Cast Group on 04/12/17.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "ViewController.h"
#import "CGDetalhesViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"jogarMoeda"])
    {
        int resultado = arc4random_uniform(2);
        CGDetalhesViewController *vc = segue.destinationViewController;
        [vc setCaraCoroa:resultado];
    }
}


@end
