//
//  CGListaViagemTableViewController.m
//  minhas-viagens
//
//  Created by Gustavo Bergamim on 20/12/17.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "CGMapaViewController.h"
#import "CGListaViagemTableViewController.h"
#import "Viagem+CoreDataProperties.h"
#import "CGViagemService.h"

@interface CGListaViagemTableViewController ()

@property (nonatomic, strong) NSArray *listaViagens;

@end

@implementation CGListaViagemTableViewController

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
    CGViagemService *service = [CGViagemService new];
    self.listaViagens = [service listar];
    if (!reloadData) return;
    [self.tableView reloadData];
}

- (void) remover:(NSArray<NSIndexPath*>*)selectedIndexes reloadData:(BOOL)reloadData
{
    CGViagemService *service = [CGViagemService new];
    for (NSIndexPath *indexPath in selectedIndexes)
    {
        Viagem *viagem = [self.listaViagens objectAtIndex:indexPath.row];
        [service remover:viagem];
    }
    [self atualizarLista:reloadData];
    NSString *plural = selectedIndexes.count > 1 ? @"ns" : @"m";
    [self exibirMensagem:[NSString stringWithFormat:@"Viage%@ excluída%@ com sucesso!", plural, plural]];
}

- (void) exibirMensagem:(NSString *)mensagem {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Minhas Viagens" message:mensagem preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:actionOk];
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listaViagens.count;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellViagem" forIndexPath:indexPath];
    Viagem *viagem = [self.listaViagens objectAtIndex:indexPath.row];
    cell.textLabel.text = viagem.local;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%.5f, %.5f", viagem.latitude, viagem.longitude];
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
    if([segue.identifier isEqualToString:@"visualizarViagem"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Viagem *viagem = [self.listaViagens objectAtIndex:indexPath.row];
        CGMapaViewController *vc = segue.destinationViewController;
        [vc setViagem:viagem];
    }
}

@end
