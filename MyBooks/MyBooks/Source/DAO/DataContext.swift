//
//  DataContext.swift
//  MyBooks
//
//  Created by Gustavo Bergamim on 20/01/18.
//  Copyright © 2018 Cast Group. All rights reserved.
//

import UIKit
import CoreData

class DataContext {

    let context: NSManagedObjectContext
    
    init() {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        self.context = (appDelegate?.persistentContainer.viewContext)!
    }
    
    func save() {
        do
        {
            try self.context.save()
        } catch {
            fatalError("Ocorreu um erro: \(error.localizedDescription)")
        }
    }
    
    func fetch<T>(sortBy sort: String? = nil, withSort sortDir: Bool = true) -> [T]
    {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: String(describing: T.self))
        if (sort != nil) {
            let sortDesc = NSSortDescriptor(key: sort!, ascending: sortDir)
            request.sortDescriptors = [sortDesc]
        }
        do
        {
            return (try self.context.fetch(request) as? [T])!
        } catch {
            fatalError("Ocorreu um erro: \(error.localizedDescription)")
        }
    }
    
    func delete(objectId: NSManagedObjectID) {
        self.context.delete(self.context.object(with: objectId));
    }
    
}
