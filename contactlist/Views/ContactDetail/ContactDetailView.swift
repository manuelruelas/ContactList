//
//  ContactDetailView.swift
//  contactlist
//
//  Created by Mac mini on 13/01/22.
//

import SwiftUI

struct ContactDetailView: View {
    @ObservedObject var viewModel:ContactViewDetailVM
    
    
    init(contact:Contact) {
        viewModel = ContactViewDetailVM(contact: contact)
    }
    var body: some View {
        VStack{
            ContactFormView(contactForm:viewModel.contact.toContactForm(),editModeEnabled: $viewModel.editModeActive){ contact in
                viewModel.saveChanges(contactForm: contact)
                viewModel.deactivateEditMode()
            }
        }
        .navigationTitle("Contact detail")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .navigationBarLeading) {
                    Text("")
                }
            
            ToolbarItem {
                if(!viewModel.editModeActive){
                    Text("Edit").onTapGesture {
                        viewModel.activateEditMode()
                    }
                }
                
            }
        }
    }
}

struct ContactDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetailView(contact: Contact())
    }
}
