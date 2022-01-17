//
//  NewContactView.swift
//  contactlist
//
//  Created by Mac mini on 12/01/22.
//

import SwiftUI

struct NewContactView: View {
    @ObservedObject var viewModel:NewContactVM = NewContactVM()
    @Environment (\.presentationMode) var presentationMode
    var body: some View {
        VStack{
            ContactFormView(editModeEnabled: .constant(true),onCompletion: { contact in
                viewModel.save(contact)
                presentationMode.wrappedValue.dismiss()
            })
        }
        .navigationTitle("Add contact")
    }
}

struct NewContactView_Previews: PreviewProvider {
    static var previews: some View {
        NewContactView()
    }
}
