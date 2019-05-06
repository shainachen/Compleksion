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
    var userID: String = UserModel.globalUserModel.checkUserID()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func SubmitPersonalInfo(_ sender: Any) {
        let db = Firestore.firestore()
        db.collection("loginData").document(self.userID).setData([
            "weight": weight.text ?? 0,
            "height": height.text ?? 0,
            "age": age.text ?? 0,
            "sex": sex.text ?? 0
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
}
