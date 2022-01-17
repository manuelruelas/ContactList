//
//  NewContactForm.swift
//  contactlist
//
//  Created by Mac mini on 11/01/22.
//

import SwiftUI

struct ContactFormView: View {
    
    @State var contactForm = ContactForm()
    @Binding var editModeEnabled:Bool
    var disableForm: Bool {
        (contactForm.name.isEmpty || contactForm.phone.isEmpty || contactForm.email.isEmpty) && editModeEnabled
    }
    
    var onCompletion:(ContactForm)->Void
   
    var body: some View {
        Form{
            Section(header:Text("Contact info")){
                TextField("Name", text: $contactForm.name)
                TextField("Phone", text: $contactForm.phone)
                TextField("Email", text: $contactForm.email)
            }
            Section(header:Text("Address")){
                TextField("Address", text: $contactForm.address)
            }
            Section(header:Text("Notes")){
                TextField("Notes", text: $contactForm.notes)
            }
            
            Button(action: {
                onCompletion(contactForm)
            }, label: {
                Text("Save")
            }).disabled(disableForm)
        }.disabled(!editModeEnabled)
        
    }
}

struct ContactFormView_Previews: PreviewProvider {
    static var previews: some View {
        ContactFormView(editModeEnabled: .constant(true), onCompletion: {args in})
    }
}
