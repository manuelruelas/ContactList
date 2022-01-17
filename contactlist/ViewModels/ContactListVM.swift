//
//  ContactListVM.swift
//  contactlist
//
//  Created by Mac mini on 12/01/22.
//

import Foundation

class ContactListVM:ObservableObject{
    static let shared = ContactListVM()
    @Published var contacts:[Contact] = []
    private let contactStorage = ContactStorage.shared
    
    func fetchContacts(){
        contacts.removeAll()
        let results = contactStorage.getAll()
        contacts.append(contentsOf: results)
    }
    
    func clearContacts(){
        contacts.removeAll()
    }
}
