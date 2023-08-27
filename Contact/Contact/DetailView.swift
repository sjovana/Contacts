//
//  DetailView.swift
//  Contact
//
//  Created by Jovana Šubarić on 19.12.22..
//

import SwiftUI

struct DetailView: View {
    let contact: Contact
    
    var body: some View {
        NavigationView{
            VStack{
                ZStack{
                    Circle()
                        .fill(Color.gray)
                        .frame(width: 100, height: 100)
                    Text("\(String(contact.first_name.uppercased().prefix(1)))" + "\(String(contact.last_name.uppercased().prefix(1)))")
                        .foregroundColor(.white)
                }
                HStack{
                    Text(contact.first_name + " " + contact.last_name)
                        .font(.title)
                        .fontWeight(.medium)
                }
                HStack{
                    Button(action: {
                        print("Send message")
                    }) {
                        VStack{
                            Image(systemName: "message.fill")
                            ZStack{
                                Text ("video cal").hidden()
                                Text("message")
                                    .lineLimit(1)
                            }
                        }
                    }
                    Button(action: {
                        print("Call")
                    }) {
                        VStack{
                            Image(systemName: "phone.fill")
                            ZStack{
                                Text ("video cal").hidden()
                                Text("call")
                                    .lineLimit(1)
                                    
                            }
                            
                        }
                    }
                    Button(action: {
                        print("Video Call")
                    }) {
                        VStack{
                            Image(systemName: "video.fill")
                            Text("video call")
                                .lineLimit(1)
                        }
                    }
                    Button(action: {
                        print("e-mail")
                    }) {
                        VStack{
                            Image(systemName: "envelope.fill")
                            ZStack{
                                Text ("video cal").hidden()
                                Text("e-mail")
                                    .lineLimit(1)
                            }

                        }
                    }
                }
                .buttonStyle(.bordered)
                Form{
                    Section{
                        VStack(alignment: .leading){
                            HStack{
                                Text("Phone")
                            }
                            HStack{
                                Text(contact.phone_number)
                                    .foregroundColor(.blue)
                                    .font(.callout)
                            }
                        }
                    }
                    Section{
                        VStack(alignment: .leading){
                            HStack{
                                Text("Note")
                            }
                            HStack{
                                Text(contact.note)
                                    .foregroundColor(.blue)
                                    .font(.callout)
                            }
                        }
                    }
                    Section
                    {
                        Button(action: {
                            print("Send message")
                        }) {
                            Text("Send message")
                        }
                        Button(action: {
                            print("Share contact")
                        }) {
                            Text("Share contact")
                        }
                        Button(action: {
                            print("Add to Favorite")
                        }) {
                            Text("Add to Favorite")
                        }
                    }
                    Section{
                        Button(action: {
                            print("Add to Emergency contact"
                            )
                        }) {
                            Text("Add to Emergency contact")
                        }
                    }
                    Section{
                        Button(action: {
                            print("Share My Location"
                            )
                        }) {
                            Text("Share My Location")
                        }
                    }
                    Section{
                        Button(action: {
                            print("Block this Contact"
                            )
                        }) {
                            Text("Block this Contact")
                                .foregroundColor(.red)
                        }
                    }
                    
                }
            }
            }
        .toolbar{
            EditButton()
        }
    }
}
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(contact: contacts[0])
    }
}
