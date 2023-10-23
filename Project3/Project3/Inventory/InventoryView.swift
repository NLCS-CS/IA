//
//  InventoryView.swift
//  Project3
//
//  Created by 이명서 on 10/22/23.
//

import SwiftUI

struct InventoryView: View {

    @ObservedObject var viewModel = InventoryViewModel()
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(viewModel.cakeList) { cake in
                    Text(cake.name)
                }
            }
        }
    }
    
    init(){
        viewModel.getData()
    }
}

#Preview {
    InventoryView()
}
