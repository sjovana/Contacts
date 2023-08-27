//
//  JSONParser.swift
//  Contact
//
//  Created by Jovana Šubarić on 18.12.22..
//

import Foundation

let contacts: [Contact] = load("contacts")

func load<T: Decodable> (_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: "json") else
    {
        fatalError()
    }
    do{
        data=try Data(contentsOf: file)
    } catch{
        fatalError()
    }
    
    do{
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch{
        fatalError()
    }
    
    
}
