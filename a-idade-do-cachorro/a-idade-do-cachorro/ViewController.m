//
//  ViewController.m
//  a-idade-do-cachorro
//
//  Created by Gustavo Bergamim on 14/11/2017.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *txtIdade;
@property (weak, nonatomic) IBOutlet UILabel *lblResultado;

@end

@implementation ViewController


/*
 Evento acionado quando a view (XIB) é carregada.
 Não é acionado quando a view é exibida novamente, pois uma vez
 criada, as views são mantidas em uma pilha.
 Para executar a cada vez que a view for exibida, existe outro evento
 responsável por isso: willAppear
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

/*
 Evento acionado quando o iOS precisa liberar memória.
 Assim a app pode definir quais recursos pode liberar
 quando o sistema precisar ˜respirar˜.
 */
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.txtIdade resignFirstResponder];
}

- (IBAction)calcularIdade:(UIButton *)sender forEvent:(UIEvent *)event {
    NSString *strIdade = self.txtIdade.text;
    
    if ([strIdade stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length > 0) {
        int idade = strIdade.intValue;
        idade = idade * 7;
        NSString *resultado = [NSString stringWithFormat:@"A idade do cachorro é %d", idade];
        self.lblResultado.text = resultado;
    }
}

@end
