//
//  CGListaEstadoControllerTableViewController.m
//  estados-do-brasil
//
//  Created by Gustavo Bergamim on 06/12/2017.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "CGListaEstadoControllerTableViewController.h"
#import "CGCelulaEstadoTableViewCell.h"
#import "CGServiceEstado.h"
#import "CGEstado.h"

@interface CGListaEstadoControllerTableViewController ()

@property (nonatomic, strong) NSArray *listaEstados;
@property (nonatomic, strong) NSDictionary *listaEstadosPorRegiao;

@end

@implementation CGListaEstadoControllerTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGServiceEstado *service = [CGServiceEstado new];
    self.listaEstados = [service recuperarEstados];
    self.listaEstadosPorRegiao = [service recuperarEstadosPorRegiao];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.listaEstadosPorRegiao.allKeys.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *listaEstadosRegiao = [self.listaEstadosPorRegiao objectForKey:@(section)];
    return listaEstadosRegiao.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [CGEstado obterNomeRegiao:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGCelulaEstadoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellEstado" forIndexPath:indexPath];
    NSArray *listaEstadosRegiao = [self.listaEstadosPorRegiao objectForKey:@(indexPath.section)];
    CGEstado *estado = listaEstadosRegiao[indexPath.row];
    [cell preencher:estado];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGEstado *estado = [self.listaEstadosPorRegiao objectForKey:@(indexPath.section)][indexPath.row];
    
    NSString *mensagem = [NSString stringWithFormat:@"O Estado que você selecionou foi %@, da região %@.", [estado nome], [estado obterNomeRegiao]];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Estado Selecionado" message:mensagem preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    
    [alert addAction:actionOk];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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
