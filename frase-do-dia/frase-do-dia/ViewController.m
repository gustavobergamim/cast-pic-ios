//
//  ViewController.m
//  frase-do-dia
//
//  Created by Gustavo Bergamim on 23/11/2017.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "ViewController.h"
#import "CGMensagem.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelMensagem;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self gerarNovaMensagem:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGMensagem*) recuperarMensagem
{
    CGMensagem *mensagemSelecionada = nil;
    
    NSMutableArray<CGMensagem*>* listaMensagens = [self recuperarListaMensagens];
    
    NSUInteger indice = arc4random_uniform((uint32_t)listaMensagens.count);
    
    mensagemSelecionada = listaMensagens[indice];
    
    return mensagemSelecionada;
}

- (NSMutableArray<CGMensagem*>*) recuperarListaMensagens
{
    NSMutableArray *lista = [@[] mutableCopy];
    
    CGMensagem *msg = [CGMensagem new];
    [msg setTexto:@"Meu modelo de negócio são os Beatles. Eles eram quatro caras que conseguiam controlar as tendências negativas um do outro. Eles equilibravam um ao outro, e o total era maior do que a soma das partes. É como eu vejo os negócios: grandes coisas em termos de negócios nunca são feitas por uma pessoa. São feitas por uma equipe de pessoas."];
    [lista addObject:msg];
    
    msg = [CGMensagem new];
    [msg setTexto:@"Às vezes, quando você inova, você comete erros. É melhor admiti-los rapidamente, e seguir em frente para melhorar suas outras inovações."];
    [lista addObject:msg];
    
    msg = [CGMensagem new];
    [msg setTexto:@"O trabalho vai preencher uma grande parte da sua vida, e a única maneira de ficar completamente satisfeito é fazer o que você acredita ser um bom trabalho. E a única forma de fazer um bom trabalho é amar aquilo que você faz. Se você ainda não descobriu o que é, continue procurando. Não se acomode. Da mesma forma que acontece com as coisas do coração, você vai saber quando encontrar."];
    [lista addObject:msg];
    
    return lista;
}
- (IBAction) gerarNovaMensagem:(UIButton *)sender
{
    CGMensagem *mensagem = [self recuperarMensagem];
    self.labelMensagem.text = [mensagem texto];
}

@end
