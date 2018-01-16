//
//  CGCoreDataContext.swift
//  to-chegando
//
//  Created by Gustavo Bergamim on 15/01/18.
//  Copyright © 2018 Cast Group. All rights reserved.
//

import UIKit;
import CoreData;

class CGCoreDataContext
{

    let context: NSManagedObjectContext;
    
    init()
    {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate;
        self.context = (appDelegate?.persistentContainer.viewContext)!;
    }
    
    func salvar()
    {
        do
        {
            try self.context.save();
        } catch {
            fatalError("Ocorreu um erro ao persistir o contexto: \(error)");
        }
    }
    
    func listar<T>(ordernarPor ordenar: String? = nil, crescente: Bool = true) -> [T]
    {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: String(describing: T.self));
        if (ordenar != nil)
        {
            let sort = NSSortDescriptor(key: ordenar!, ascending: crescente);
            request.sortDescriptors = [sort];
        }
        do
        {
            return (try self.context.fetch(request) as? [T])!;
        } catch {
            fatalError("Ocorreu um erro ao executar a consulta: \(error)");
        }
    }
    
    func excluir(withId objectId: NSManagedObjectID)
    {
        self.context.delete(self.context.object(with: objectId));
    }
}
