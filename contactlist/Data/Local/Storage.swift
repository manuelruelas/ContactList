//
//  Storage.swift
//  contactlist
//
//  Created by Mac mini on 11/01/22.
//

import Foundation
import CoreData

protocol Storage {
    associatedtype Element
    func save()
    func getAll() ->[Element]
}

extension Storage{
    var context:NSManagedObjectContext{
        get{
            PersistenceController.shared.container.viewContext
        }
    }
}


