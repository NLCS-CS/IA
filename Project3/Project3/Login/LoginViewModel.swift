//
//  LoginViewModel.swift
//  Project3
//
//  Created by 이명서 on 10/22/23.
//

import Foundation
import FirebaseFirestore

class LoginViewModel: ObservableObject {
    
    @Published var user: User!
    
    init(){
        //get user data from firestore
        self.getData()
    }
    
    private func getData(){//get user data from firestore
        
        let db = Firestore.firestore()//reference to the db
        
        db.collection("user")
                    .getDocuments { snapshot, error in
                        // check errors
                        if nil == error {
                            // no errors
                            if let snapshot = snapshot {
                                
                                // get all the documents and create Cake List
                                self.user = snapshot.documents.map({ doc in
                                    print("documents value : \(doc)")
                                    return User(id: doc.documentID,
                                                userID: doc["userID"] as? Int ?? 0,
                                                userName: doc["userName"] as? String ?? "",
                                                password: doc["password"] as? String ?? "")
                                }).first!
                            }
                        }
                    }
    }
}
