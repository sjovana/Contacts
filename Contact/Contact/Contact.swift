//
//  Contact.swift
//  Contact
//
//  Created by Jovana Šubarić on 18.12.22..
//

import Foundation

struct Contact: Decodable, Hashable
{

    var first_name: String
    var last_name: String
    var phone_number: String
    var note: String
    
}
