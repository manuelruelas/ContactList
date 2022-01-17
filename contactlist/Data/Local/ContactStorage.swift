//
//  ContactStorage.swift
//  contactlist
//
//  Created by Mac mini on 12/01/22.
//

import Foundation
import CoreData
class ContactStorage:Storage{
    typealias Element = Contact
    static let shared = ContactStorage()
    func save() {
        do{
            try context.save()
        }catch{
            print(error.localizedDescription)
        }
        
    }
    
    func getAll() -> [Contact] {
        let fetchRequest: NSFetchRequest<Contact>
        fetchRequest = Contact.fetchRequest()
        do{
            let contacts = try context.fetch(fetchRequest) as [Contact]
            return contacts
        }
        catch{
            print(error.localizedDescription)
            return []
        }
        
    }
}
