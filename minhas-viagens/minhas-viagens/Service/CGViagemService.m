//
//  CGViagemService.m
//  minhas-viagens
//
//  Created by Gustavo Bergamim on 20/12/17.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "CGViagemService.h"
#import "AppDelegate.h"

@interface CGViagemService()

@property (nonatomic, strong, readonly) NSManagedObjectContext *gerenciadorObjetos;

@end

@implementation CGViagemService

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

- (NSArray<Viagem*>*) listar
{
    return [self filtrar:[Viagem class] peloSeletor:@selector(local) comParam:@""];
}

- (void) salvarViagemPara:(NSString *)local latitude:(double)latitude longitude:(double)longitude
{
    NSString *entityName = NSStringFromClass([Viagem class]);
    Viagem *viagem = [NSEntityDescription insertNewObjectForEntityForName:entityName inManagedObjectContext:self.gerenciadorObjetos];
    
    [viagem setLocal:local];
    [viagem setLatitude:latitude];
    [viagem setLongitude:longitude];
    
    [self.gerenciadorObjetos insertObject:viagem];
    
    NSError *error;
    [self.gerenciadorObjetos save:&error];
    if (error)
    {
        NSLog(@"Erro ao executar instrução %@", [error localizedDescription]);
    }
}

- (void)remover:(Viagem *)viagem
{
    NSError *error;
    [self.gerenciadorObjetos deleteObject:viagem];
    [self.gerenciadorObjetos save:&error];
    if (error)
    {
        NSLog(@"Erro ao executar instrução %@", [error localizedDescription]);
    }
}

- (NSArray<Class>*) filtrar:(Class)classe peloSeletor:(SEL)seletor comParam:(NSString*)param
{
    //    if (![classe instancesRespondToSelector:@selector(fetchRequest)] || ![classe instancesRespondToSelector:seletor]) return nil;
    
    NSString *propertyName = NSStringFromSelector(seletor);
    NSFetchRequest *fetch = [classe fetchRequest];
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:propertyName ascending:YES];
    [fetch setSortDescriptors:@[sort]];
    
    if (param.length > 0)
    {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K contains[cd] %@", propertyName, param];
        [fetch setPredicate:predicate];
    }
    
    NSError *error;
    NSArray<Class> *array = [self.gerenciadorObjetos executeFetchRequest:fetch error:&error];
    if (error)
    {
        NSLog(@"Erro ao executar instrução %@", [error localizedDescription]);
    }
    return array;
}

@end
