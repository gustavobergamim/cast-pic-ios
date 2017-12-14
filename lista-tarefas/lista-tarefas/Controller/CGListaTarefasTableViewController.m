//
//  CGListaTarefasTableViewController.m
//  lista-tarefas
//
//  Created by Gustavo Bergamim on 13/12/2017.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "CGListaTarefasTableViewController.h"
#import "CGTarefaServiceArchiver.h"
#import "CGTarefa.h"
#import "CGTarefaTableViewCell.h"


@interface CGListaTarefasTableViewController ()

@property (nonatomic, strong) NSArray *listaTarefas;

@end

@implementation CGListaTarefasTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear:(BOOL)animated {
    [self atualizarLista:YES];
}

- (IBAction) excluirTarefas:(UIBarButtonItem *)sender {
    NSArray<NSIndexPath*> *selectedIndexes = [self.tableView indexPathsForSelectedRows];
    if (selectedIndexes.count > 0)
    {
        [self removerTarefas:selectedIndexes];
    }
    else
    {
        [self exibirMensagem:@"Nenhuma tarefa selecionada."];
    }
}

- (void) atualizarLista:(BOOL)reloadData
{
    CGTarefaServiceArchiver *service = [CGTarefaServiceArchiver new];
    self.listaTarefas = [service recuperarTarefas];
    if (!reloadData) return;
    [self.tableView reloadData];
}

- (void) exibirMensagem:(NSString *)mensagem {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Minhas Tarefas" message:mensagem preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:actionOk];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void) removerTarefas:(NSArray<NSIndexPath*>*)selectedIndexes
{
    [self removerTarefas:selectedIndexes reloadData:YES];
}

- (void) removerTarefas:(NSArray<NSIndexPath*>*)selectedIndexes reloadData:(BOOL)reloadData
{
    CGTarefaServiceArchiver *service = [CGTarefaServiceArchiver new];
    for (NSIndexPath *indexPath in selectedIndexes)
    {
        CGTarefa *tarefa = [self.listaTarefas objectAtIndex:indexPath.row];
        [service removerTarefa:tarefa];
    }
    [self atualizarLista:reloadData];
    NSString *plural = selectedIndexes.count > 1 ? @"s" : @"";
    [self exibirMensagem:[NSString stringWithFormat:@"Tarefa%@ excluída%@ com sucesso!", plural, plural]];
}

#pragma mark - Table view data source

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.listaTarefas.count;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGTarefaTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellTarefa" forIndexPath:indexPath];
    CGTarefa *tarefa = [self.listaTarefas objectAtIndex:indexPath.row];
    [cell preencher:tarefa];
    return cell;
}

- (BOOL) tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self removerTarefas:@[indexPath] reloadData:NO];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
