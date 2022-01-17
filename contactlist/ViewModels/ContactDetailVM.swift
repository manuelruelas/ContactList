//
//  ContactDetailViewModel.swift
//  contactlist
//
//  Created by Mac mini on 13/01/22.
//

import Foundation

class ContactViewDetailVM:ObservableObject{
    @Published var editModeActive:Bool = false
    private var storage = ContactStorage.shared
    var contact:Contact
    
    init(contact:Contact) {
        self.contact = contact
    }
    
    func saveChanges(contactForm:ContactForm){
        contact.name = contactForm.name
        contact.phone = contactForm.phone
        contact.email = contactForm.email
        contact.address = contactForm.address
        contact.notes = contactForm.notes
        storage.save()
    }
    
    func activateEditMode(){
        editModeActive = true
    }
    
    func deactivateEditMode(){
        editModeActive = false
    }
    
}


extension Contact{
    func toContactForm()->ContactForm{
        let contactForm = ContactForm()
        contactForm.name = self.name ?? ""
        contactForm.phone = self.phone ?? ""
        contactForm.email = self.email ?? ""
        contactForm.address = self.address ?? ""
        contactForm.notes = self.notes ?? ""
        return contactForm
    }
}
