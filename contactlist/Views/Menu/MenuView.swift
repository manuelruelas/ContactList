//
//  menuView.swift
//  contactlist
//
//  Created by Mac mini on 11/01/22.
//

import SwiftUI

struct MenuView: View {
    @State var showAddContactSheet:Bool = false
    var body: some View {
        
        List{
            NavigationLink(destination: ContactListView()){
                HStack{
                    Image(systemName: "list.dash")
                    Text("Contact list")
                }
            }
            HStack{
                Image(systemName: "plus.app")
                Text("Add contact")
            }.onTapGesture {
                showAddContactSheet.toggle()
            }
            NavigationLink(destination: WeatherDetail()){
                HStack{
                    Image(systemName: "thermometer.sun.fill")
                    Text("Current Weather")
                }
            }
        }
        .navigationTitle("Menu")
        .sheet(isPresented: $showAddContactSheet) {
            NavigationView{
                NewContactView()
            }
            
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            MenuView()
        }
        
    }
}
