//
//  CGListaFilmesTableViewController.m
//  meus-filmes
//
//  Created by Gustavo Bergamim on 11/12/2017.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "CGDetalheFilmeViewController.h"
#import "CGListaFilmesTableViewController.h"
#import "CGFilmeTableViewCell.h"
#import "CGServiceFilme.h"
#import "CGFilme.h"

@interface CGListaFilmesTableViewController ()

@property (nonatomic, strong) NSArray *listaFilmes;

@end

@implementation CGListaFilmesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGServiceFilme *service = [CGServiceFilme new];
    self.listaFilmes = [service recuperarFilmes];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listaFilmes.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFilmeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellFilme" forIndexPath:indexPath];
    CGFilme *filme = [self.listaFilmes objectAtIndex:indexPath.row];
    [cell preencher:filme];
    return cell;
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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(CGFilmeTableViewCell *)sender {
    if([segue.identifier isEqualToString:@"detalharFilme"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        CGFilme *filme = [self.listaFilmes objectAtIndex:indexPath.row];
        CGDetalheFilmeViewController *vc = segue.destinationViewController;
        [vc setFilme:filme];
    }
}


@end
