//
//  CGNotaService.m
//  minhas-notas-diarias
//
//  Created by Gustavo Bergamim on 18/12/17.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "CGNotaService.h"
#import "AppDelegate.h"

@interface CGNotaService ()

@property (nonatomic, strong, readonly) NSManagedObjectContext *gerenciadorObjetos;

@end

@implementation CGNotaService

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

- (NSArray<Nota*>*) listarNotas
{
    return [self filtrar:[Nota class] peloSeletor:@selector(conteudo) comParam:@""];
}

- (void) remover:(Nota*)nota
{
    NSError *error;
    [self.gerenciadorObjetos deleteObject:nota];
    [self.gerenciadorObjetos save:&error];
    if (error)
    {
        NSLog(@"Erro ao executar instrução %@", [error localizedDescription]);
    }
}

- (void)alterar:(Nota*)nota;
{
    [nota setDataUltimaAlteracao:[NSDate date]];
    NSError *error;
    [self.gerenciadorObjetos save:&error];
    if (error)
    {
        NSLog(@"Erro ao executar instrução %@", [error localizedDescription]);
    }
}

- (void) adicionar:(NSString*)conteudo
{
    NSString *entityName = NSStringFromClass([Nota class]);
    Nota *nota = [NSEntityDescription insertNewObjectForEntityForName:entityName inManagedObjectContext:self.gerenciadorObjetos];
    
    [nota setCodigo:[NSUUID UUID]];
    [nota setConteudo:conteudo];
    [nota setDataCriacao:[NSDate date]];
    [nota setDataUltimaAlteracao:[NSDate date]];
    
    NSError *error;
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
