//
//  UserModel.swift
//  Complekshun
//
//  Created by Derek Hsiao on 5/2/19.
//  Copyright © 2019 iosdecal. All rights reserved.
//

import UIKit
import Firebase

class UserModel {
    let db: Firestore!
    
    static let globalUserModel = UserModel()
    
    init() {
        db = Firestore.firestore()
    }
    
    func checkUserID() -> String {
        return Auth.auth().currentUser?.uid ?? "notLoggedIn"
    }
}
    
//    func fetchImages {
//        db.collection("entryData").whereField("acne", isEqualTo: 9)
//            .getDocuments() { (querySnapshot, err) in
//                if let err = err {
//                    print("Error getting documents: \(err)")
//                } else {
//                    for document in querySnapshot!.documents {
//                        print("\(document.documentID) => \(document.data())")
//                    }
//                }
//        }
//    }

//db.collection("entryData").whereField("acne", isEqualTo: 9)
//    .getDocuments() { (querySnapshot, err) in
//        if let err = err {
//            print("Error getting documents: \(err)")
//        } else {
//            for document in querySnapshot!.documents {
//                print("\(document.documentID) => \(document.data())")
//            }
//        }
//}

//func submitLoginData(weight: Int?, height: Int?, age: Int?, sex: Int?) {
//    db.collection("loginData").document(self.checkUserID()).setData([
//        "weight": weight ?? 0,
//        "height": height ?? 0,
//        "age": age ?? 0,
//        "sex": sex ?? 0
//    ]) { err in
//        if let err = err {
//            print("Error writing document: \(err)")
//        } else {
//            print("Document successfully written!")
//        }
//    }
//}
//
//func submitDailyData(calorieCount: Int, vegetableSelected: Int, dairySelected: Int, proteinSelected: Int, grainsSelected: Bool, fruitsSelected: Bool, otherSelected: Bool, medications: String, sleepCount: Int, numAcne: Int) {
//    db.collection("entryData").document(self.checkUserID()).setData([
//        "user_id": self.checkUserID(),
//        "calories": calorieCount,
//        "vegetables": vegetableSelected,
//        "dairy": dairySelected,
//        "protein": proteinSelected,
//        "grains": grainsSelected,
//        "fruits": fruitsSelected,
//        "other": otherSelected,
//        "medications": medications,
//        "sleep": sleepCount,
//        "acne": numAcne
//    ]) { err in
//        if let err = err {
//            print("Error writing document: \(err)")
//        } else {
//            print("Entry data successfully written!")
//        }
//    }
//}
