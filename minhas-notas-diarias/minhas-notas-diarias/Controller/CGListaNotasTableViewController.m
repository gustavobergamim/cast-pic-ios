//
//  CGListaNotasTableViewController.m
//  minhas-notas-diarias
//
//  Created by Gustavo Bergamim on 18/12/17.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "CGListaNotasTableViewController.h"
#import "CGNotaTableViewCell.h"
#import "AppDelegate.h"
#import "NSDate+CGDate.h"
#import "Nota+CoreDataProperties.h"
#import "CGNotaService.h"
#import "CGNotaViewController.h"

@interface CGListaNotasTableViewController ()

@property (nonatomic, strong) NSArray *listaNotas;

@end

@implementation CGListaNotasTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) viewWillAppear:(BOOL)animated {
    [self atualizarLista:YES];
}

- (void) atualizarLista:(BOOL)reloadData
{
    CGNotaService *service = [CGNotaService new];
    self.listaNotas = [service listarNotas];
    if (!reloadData) return;
    [self.tableView reloadData];
}

- (void) remover:(NSArray<NSIndexPath*>*)selectedIndexes reloadData:(BOOL)reloadData
{
    CGNotaService *service = [CGNotaService new];
    for (NSIndexPath *indexPath in selectedIndexes)
    {
        Nota *nota = [self.listaNotas objectAtIndex:indexPath.row];
        [service remover:nota];
    }
    [self atualizarLista:reloadData];
    NSString *plural = selectedIndexes.count > 1 ? @"s" : @"";
    [self exibirMensagem:[NSString stringWithFormat:@"Nota%@ excluída%@ com sucesso!", plural, plural]];
}

- (void) exibirMensagem:(NSString *)mensagem {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Minhas Notas" message:mensagem preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:actionOk];
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listaNotas.count;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGNotaTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellNota" forIndexPath:indexPath];
    Nota *nota = [self.listaNotas objectAtIndex:indexPath.row];
    [cell preencher:nota];
    return cell;
}

- (BOOL) tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self remover:@[indexPath] reloadData:NO];
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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"editarNota"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Nota *nota = [self.listaNotas objectAtIndex:indexPath.row];
        CGNotaViewController *vc = segue.destinationViewController;
        [vc setNotaAlteracao:nota];
    }
}

@end
