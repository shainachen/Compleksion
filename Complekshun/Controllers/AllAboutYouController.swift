//
//  AllAboutYouController.swift
//  Complekshun
//
//  Created by shaina on 4/21/19.
//  Copyright © 2019 iosdecal. All rights reserved.
//

import UIKit
import Firebase

class AllAboutYouController: UIViewController {
    
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var sex: UITextField!
    var userID: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("allaboutcontroller id: ", userID)
        // Do any addi\tional setup after loading the view.
    }
    
    @IBAction func SubmitPersonalInfo(_ sender: Any) {
        let db = Firestore.firestore()
        db.collection("loginData").document(userID ?? "notLoggedIn").setData([
            "weight": weight.text,
            "height": height.text,
            "age": age.text,
            "sex": sex.text
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
//        db.collection["users"].document["]
    }
    
    
    
}
