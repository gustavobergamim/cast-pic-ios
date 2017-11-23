//
//  ViewController.m
//  gasolina-alcool
//
//  Created by Gustavo Bergamim on 23/11/2017.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UITextField *_textFieldAtivo;
}

@property (weak, nonatomic) IBOutlet UITextField *textAlcool;
@property (weak, nonatomic) IBOutlet UITextField *textGasolina;
@property (weak, nonatomic) IBOutlet UILabel *labelResultado;

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



- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_textFieldAtivo resignFirstResponder];
}

- (BOOL) textFieldShouldBeginEditing:(UITextField *)textField
{
    _textFieldAtivo = textField;
    return YES;
}


- (IBAction) calcular:(UIButton*)sender
{
    NSNumber *alcoolNumber = [[NSNumberFormatter new] numberFromString: self.textAlcool.text];
    double valorAlcool = alcoolNumber.doubleValue;
    
    NSNumber *gasolinaNumber = [[NSNumberFormatter new] numberFromString: self.textGasolina.text];
    double valorGasolina = gasolinaNumber.doubleValue;
    
    double resultado = valorAlcool / valorGasolina;
    
    NSString *mensagemResultado = @"";
    if(resultado > 0.7)
    {
        mensagemResultado = @"Vai de Gasolina!";
    }
    else
    {
        mensagemResultado = @"Vai de Álcool!";
    }
    
    self.labelResultado.text = mensagemResultado;
    [_textFieldAtivo resignFirstResponder];
}

@end
