//
//  ContactRow.swift
//  contactlist
//
//  Created by Mac mini on 13/01/22.
//

import SwiftUI

struct ContactRow: View {
    @State var contact:Contact
    var body: some View {
        HStack{
            Image(systemName: "person.fill")
            VStack(alignment:.leading){
                contact.name.map(Text.init)
                contact.phone.map(Text.init)
            }
            
        }
    }
}

struct ContactRow_Previews: PreviewProvider {
    static var previews: some View {
        ContactRow(contact: Contact())
    }
}
