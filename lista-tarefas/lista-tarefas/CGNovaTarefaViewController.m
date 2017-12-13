//
//  CGNovaTarefaViewController.m
//  lista-tarefas
//
//  Created by Gustavo Bergamim on 13/12/2017.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "CGNovaTarefaViewController.h"
#import "CGTarefaService.h"

@interface CGNovaTarefaViewController ()

@property (weak, nonatomic) IBOutlet UITextField *txtTarefa;

@end

@implementation CGNovaTarefaViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    [self.txtTarefa becomeFirstResponder];
}

- (void) didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self.txtTarefa resignFirstResponder];
}

- (IBAction) adicionarTarefa:(UIButton *)sender {
    CGTarefaService *service = [CGTarefaService new];
    [service adicionarTarefa:self.txtTarefa.text];
    [self exibirMensagem:@"Tarefa adicionada com sucesso." fecharView:YES];
}

- (void) exibirMensagem:(NSString *)mensagem fecharView:(BOOL)fecharView {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Minhas Tarefas" message:mensagem preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (fecharView)
        {
            [self fecharViewController];
        }
    }];
    UIAlertAction *actionNovaTarefa = [UIAlertAction actionWithTitle:@"Novo" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.txtTarefa.text = @"";
        [self.txtTarefa becomeFirstResponder];
    }];
    [alert addAction:actionOk];
    [alert addAction:actionNovaTarefa];
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
