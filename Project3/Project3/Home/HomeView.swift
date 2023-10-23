//
//  HomeView.swift
//  Project3
//
//  Created by 이명서 on 10/22/23.
//

import SwiftUI

struct HomeView: View {
    
    @State var goInventoryView: Bool = false //InventoryView로 push 할지 플래그
    @State var goOrderView: Bool = false //OrderView로 push 할지 플래그
    
    
    var body: some View {
        
        NavigationStack{
            VStack {
                
                //title text
                Text("Organize Our Cakes")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                VStack{
                    //inventory button
                    Button {
                        //action
                        //set goInventoryView flag true
                        goInventoryView = true
                    } label: {
                        Text("Inventory")
                            .font(.body)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.black)
                            .padding(20)
                            .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.black, lineWidth: 2.0)
                            )
                    }
                    
                    Divider()
                    
                    //order button
                    Button {
                        //action
                        //set goOrderView flag true
                        goOrderView = true
                    } label: {
                        Text("Order")
                            .font(.body)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.black)
                            .padding(20)
                            .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.black, lineWidth: 2.0)
                            )
                    }
                }.padding(30)

            }.padding(15)//30
                .navigationDestination(isPresented: $goInventoryView){
                    //push to InventoryView when goInventoryView = true
                    InventoryView()
                }
                .navigationDestination(isPresented: $goOrderView){
                    
                }
        }
    }
}

#Preview {
    HomeView()
}
