//
//  ViewController.m
//  core-data-stack
//
//  Created by Gustavo Bergamim on 14/12/17.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@property (nonatomic, strong) AppDelegate *appDelegate;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
//    NSManagedObject *objeto = [NSEntityDescription insertNewObjectForEntityForName:@"Pessoa" inManagedObjectContext:self.appDelegate.persistentContainer.viewContext];
//    [objeto setValue:@"Gustavo" forKey:@"nome"];
//    [objeto setValue:@"Bergamim" forKey:@"sobrenome"];
    
    NSError *error;
    [self.appDelegate.persistentContainer.viewContext save:&error];
    if (error)
    {
        NSLog(@"Erro ao executar instrução %@", [error description]);
        return;
    }
    
    NSFetchRequest *fetch = [NSFetchRequest fetchRequestWithEntityName:@"Pessoa"];
    NSArray<NSManagedObject*> *array = [self.appDelegate.persistentContainer.viewContext executeFetchRequest:fetch error:&error];
    if (error)
    {
        NSLog(@"Erro ao executar instrução %@", [error description]);
        return;
    }
    
    for (NSManagedObject *obj in array)
    {
        NSLog(@"Nome: %@ \n", [obj valueForKey:@"nome"]);
        NSLog(@"Sobrenome: %@ \n", [obj valueForKey:@"sobrenome"]);
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
