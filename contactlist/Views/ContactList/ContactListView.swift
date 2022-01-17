//
//  ContactListView.swift
//  contactlist
//
//  Created by Mac mini on 12/01/22.
//

import SwiftUI

struct ContactListView: View {
    @ObservedObject var viewModel = ContactListVM.shared
    var body: some View {
        VStack{
            List(viewModel.contacts,id:\.self){ value in
                NavigationLink(
                    destination: ContactDetailView(contact: value),
                    label: {
                        ContactRow(contact: value)
                    }
                )
            }
        }
        .navigationTitle("Contacts")
        .onAppear{
            viewModel.fetchContacts()
        }.onDisappear{
            viewModel.clearContacts()
        }
    }
}

struct ContactListView_Previews: PreviewProvider {
    static var previews: some View {
        ContactListView()
    }
}
