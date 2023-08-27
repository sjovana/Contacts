//
//  ContactList.swift
//  Contact
//
//  Created by Jovana Šubarić on 18.12.22..
//

import SwiftUI

import SwiftUI

struct ContactList: View {
    
    @State private var search=""
    
    let alphabet = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W", "X","Y", "Z"]
    
    private var searchResult: [Contact]
    {
        if search.isEmpty
        {
            return contacts
        }
        else
        {
            return contacts.filter { $0.first_name.contains(search) || $0.last_name.contains(search)}
        }
        
    }
    
    var body: some View {
    
        NavigationView{
             ScrollView {
                 ScrollViewReader{value in
                    HStack{
                        ZStack{
                            List{
                                ForEach(alphabet, id: \.self) { letter in
                                    let con = searchResult.filter ({$0.first_name.starts(with: letter)})
                                    if !con.isEmpty
                                    {
                                        Section(header: Text(letter))
                                        {
                                            ForEach(con, id:\.self) { c in
                                                ZStack{
                                                    NavigationLink(destination: DetailView(contact: c))
                                                    {
                                                        EmptyView()
                                                        
                                                    }
                                                    .opacity(0)
                                                    .buttonStyle(PlainButtonStyle())
                                                    HStack{

                                                        ContactRow(contact: c)
                                                            .padding(10)
                                                        Spacer()
                                                    }
                                                }
                                            }
                                            
                                        }.id(letter)
                                    }
                                }
                            }
                            HStack
                            {
                                Spacer()
                                VStack (spacing: 3){
                                    ForEach(alphabet, id:\.self) { alpha in
                                        let conn = searchResult.filter ({$0.first_name.starts(with: alpha)})
                                        if !conn.isEmpty{
                                            Button (alpha) {
                                                withAnimation{
                                                    value.scrollTo(alpha, anchor: .top)
                                                }
                                            }
                                        }
                                        else
                                        {
                                            Button(action: {
                                                print ("\(alpha)")
                                            }) {
                                                Text("\(alpha)")
                                            }
                                        }
                                    }   .frame(maxHeight: .infinity)
                                        
                                        
                                }
                            }
                        }
                            .navigationTitle("Contacts")
                            .toolbar{
                                Button(action: { print("") }) {
                                        Image(systemName: "plus")
                                    }
                                }
                            .searchable(text: $search) {}
                    }
     
                    
                
                }
            }
        }
    }
}

struct ContactList_Previews: PreviewProvider {
    static var previews: some View {
        ContactList()
    }
}
