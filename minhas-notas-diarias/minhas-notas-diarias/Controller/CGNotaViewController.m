//
//  CGNotaViewController.m
//  minhas-notas-diarias
//
//  Created by Gustavo Bergamim on 18/12/17.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "CGNotaViewController.h"
#import "CGNotaService.h"

@interface CGNotaViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textNota;

@end

@implementation CGNotaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.textNota becomeFirstResponder];
    if (self.notaAlteracao)
    {
        self.textNota.text = self.notaAlteracao.conteudo;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self.textNota resignFirstResponder];
}

- (IBAction)salvarNota:(UIButton *)sender {
    CGNotaService *service = [CGNotaService new];
    if (self.notaAlteracao)
    {
        self.notaAlteracao.conteudo = self.textNota.text;
        [service alterar:self.notaAlteracao];
    }
    else
    {
        [service adicionar:self.textNota.text];
    }
    [self exibirMensagem:@"Nota salva com sucesso." fecharView:YES];
}

- (void) exibirMensagem:(NSString *)mensagem fecharView:(BOOL)fecharView {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Minhas Notas" message:mensagem preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (fecharView)
        {
            [self fecharViewController];
        }
    }];
    UIAlertAction *actionNovo = [UIAlertAction actionWithTitle:@"Novo" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.textNota.text = @"";
        self.notaAlteracao = nil;
        [self.textNota becomeFirstResponder];
    }];
    [alert addAction:actionOk];
    [alert addAction:actionNovo];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void) fecharViewController
{
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
