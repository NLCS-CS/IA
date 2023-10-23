//
//  InventoryViewModel.swift
//  Project3
//
//  Created by 이명서 on 10/22/23.
//

import Foundation
import FirebaseFirestore

class InventoryViewModel: ObservableObject {
    
    @Published var cakeList = [Cake]()
    
        //get cake list from db
        func getData() {
            let db = Firestore.firestore()//reference to the db
            
            db.collection("cakes") //read doccument
                .getDocuments { snapshot, error in
                    // check errors
                    if nil == error {
                        // no errors
                        if let snapshot = snapshot {
                            //update the cakeList property in main thread
                            DispatchQueue.main.async {
                                //get all documents and cake list
                                self.cakeList = snapshot.documents.map { document in
                                    return Cake(id: document.documentID,
                                                name: document["name"] as? String ?? "",
                                                stock: document["stock"] as? Int ?? 0,
                                                price: document["price"] as? Int ?? 0)}
                            }
                        }
                    }
                }
            }
    //add cake to db
    func addNewCake(name:String, stock:Int, price:Int){
        
        //reference to db
        let db = Firestore.firestore()
        
        //add documents
        db.collection("cakes")
            .addDocument(data: [
                "name" : name,
                "stock" : stock,
                "price" : price
            ]) { error in
                //check error
                if nil == error {
                    //no errors
                    
                    //call getData() func to retrive latest data
                    self.getData()
                }
            }
    }
    //delete cake from db
    func deleteCake(){
        
    }
    //update stock in db
    func updateStockCount(){
        
    }
}
