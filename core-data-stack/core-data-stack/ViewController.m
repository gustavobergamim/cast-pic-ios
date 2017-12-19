//
//  ViewController.m
//  core-data-stack
//
//  Created by Gustavo Bergamim on 14/12/17.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "NSDate+CGDate.h"
#import "Pessoa+CoreDataProperties.h"


@interface ViewController ()

@property (nonatomic, strong, readonly) NSManagedObjectContext *gerenciadorObjetos;

@end


@implementation ViewController

@synthesize gerenciadorObjetos = _gerenciadorObjetos;

- (NSManagedObjectContext *)gerenciadorObjetos
{
    if (!_gerenciadorObjetos)
    {
        AppDelegate *delegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
        _gerenciadorObjetos = delegate.persistentContainer.viewContext;
    }
    return _gerenciadorObjetos;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self listarPessoas];
}

- (void) criarPessoa
{
    NSString *entityName = NSStringFromClass([Pessoa class]);
    Pessoa *pessoa = [NSEntityDescription insertNewObjectForEntityForName:entityName inManagedObjectContext:self.gerenciadorObjetos];

    [pessoa setCodigo:[NSUUID UUID]];
    [pessoa setNome:@"Gustavo"];
    [pessoa setSobrenome:@"Bergamim"];
    [pessoa setDataNascimento:[NSDate dateFromYear:1987 month:02 day:25]];
    [pessoa setIdade:30];

    NSError *error;
    [self.gerenciadorObjetos save:&error];
    if (error)
    {
        NSLog(@"Erro ao executar instrução %@", [error description]);
    }
}

- (void) listarPessoas
{
    NSArray<Pessoa*> *array = [self filtrar:[Pessoa class] peloSeletor:@selector(nome) comParam:@"Gust"];
    
    for (Pessoa *p in array)
    {
        NSLog(@"Id: %@ \n", p.codigo);
        NSLog(@"Nome: %@ \n", p.nome);
        NSLog(@"Sobrenome: %@ \n", p.sobrenome);
        NSLog(@"Data Nascimento: %@ \n", p.dataNascimento);
        NSLog(@"Idade: %i \n", p.idade);
    }
}

- (NSArray<Class>*) filtrar:(Class)classe peloSeletor:(SEL)seletor comParam:(NSString*)param
{
//    if (![classe instancesRespondToSelector:@selector(fetchRequest)] || ![classe instancesRespondToSelector:seletor]) return nil;
    
    NSString *propertyName = NSStringFromSelector(seletor);
    NSFetchRequest *fetch = [classe fetchRequest];
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:propertyName ascending:NO];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%@ contains[cd] %@", propertyName, param];
    [fetch setSortDescriptors:@[sort]];
    [fetch setPredicate:predicate];
    NSError *error;
    NSArray<Class> *array = [self.gerenciadorObjetos executeFetchRequest:fetch error:&error];
    if (error)
    {
        NSLog(@"Erro ao executar instrução %@", [error localizedDescription]);
    }
    return array;
}




- (void) coreDataPadrao
{
    NSManagedObject *pessoa = [NSEntityDescription insertNewObjectForEntityForName:@"Pessoa" inManagedObjectContext:self.gerenciadorObjetos];
    [pessoa setValue:[NSUUID UUID] forKey:@"codigo"];
    [pessoa setValue:@"Gustavo" forKey:@"nome"];
    [pessoa setValue:@"Bergamim" forKey:@"sobrenome"];
    [pessoa setValue:[NSDate dateFromYear:1987 month:02 day:25] forKey:@"dataNascimento"];
    [pessoa setValue:@(30) forKey:@"idade"];
    
    NSError *error;
    [self.gerenciadorObjetos save:&error];
    if (error)
    {
        NSLog(@"Erro ao executar instrução %@", [error description]);
        return;
    }
    
    NSFetchRequest *fetch = [NSFetchRequest fetchRequestWithEntityName:@"Pessoa"];
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"idade" ascending:NO];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"nome beginsWith %@", @"Gust"];
    [fetch setSortDescriptors:@[sort]];
    [fetch setPredicate:predicate];
    
    NSArray<NSManagedObject*> *array = [self.gerenciadorObjetos executeFetchRequest:fetch error:&error];
    if (error)
    {
        NSLog(@"Erro ao executar instrução %@", [error localizedDescription]);
        return;
    }
    
    for (NSManagedObject *obj in array)
    {
        [self.gerenciadorObjetos deleteObject:obj];
        NSLog(@"Id: %@ \n", [obj valueForKey:@"codigo"]);
        NSLog(@"Nome: %@ \n", [obj valueForKey:@"nome"]);
        NSLog(@"Sobrenome: %@ \n", [obj valueForKey:@"sobrenome"]);
        NSLog(@"Data Nascimento: %@ \n", [obj valueForKey:@"dataNascimento"]);
        NSLog(@"Idade: %@ \n", [obj valueForKey:@"idade"]);
    }
    [self.gerenciadorObjetos save:&error];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
