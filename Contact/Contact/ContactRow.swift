//
//  ContactRow.swift
//  Contact
//
//  Created by Jovana Šubarić on 18.12.22..
//

import SwiftUI

struct ContactRow: View {
    let contact: Contact
    
    var body: some View {
    
        VStack(){
            HStack{
                Text(contact.first_name + " " + contact.last_name)
                    .font(.system(size: 21, weight: .medium, design: .default))
                    .multilineTextAlignment(.leading)
                Spacer()
               
                }
            }
        }
    }


struct ContactRow_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ContactRow(contact: contacts[0])
            ContactRow(contact: contacts[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
