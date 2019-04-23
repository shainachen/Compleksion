//
//  DailyEntryController.swift
//  Complekshun
//
//  Created by shaina on 4/22/19.
//  Copyright © 2019 iosdecal. All rights reserved.
//

import UIKit
import Firebase

class DailyEntryController: UIViewController {
    var image: UIImage?
    @IBOutlet weak var calories: UITextField!
    @IBOutlet weak var categories: UITextField!
    @IBOutlet weak var medications: UITextField!
    @IBOutlet weak var sleep: UITextField!
    weak var img: UIImage!
    //todo: implement camera to get uiimage

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
     @IBAction func submitDailyEntry(_ sender: Any) {
        //todo: change categories and medications to different data structure
        let db = Firestore.firestore()
        let date = Date();
        let day = String(date.description.prefix(10))
        db.collection("entryData").document(day).setData([
            "calories": calories.text,
            "categories": categories.text,
            "medications": medications.text,
            "sleep": sleep.text,
            "image": img
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
}
