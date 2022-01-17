//
//  NewContactVM.swift
//  contactlist
//
//  Created by Mac mini on 12/01/22.
//

import Foundation

class NewContactVM:ObservableObject{
    @Published var contact:Contact = Contact()
    private let contactStorage = ContactStorage()
    
    func save(_ contact:ContactForm){
        let newContact = Contact(context: PersistenceController.shared.container.viewContext)
        newContact.name = contact.name
        newContact.phone = contact.phone
        newContact.email = contact.email
        newContact.address = contact.address
        newContact.notes = contact.notes
        contactStorage.save()
    }
}
