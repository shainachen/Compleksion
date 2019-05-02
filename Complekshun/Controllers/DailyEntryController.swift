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
    var numAcne: Int?
    @IBOutlet weak var calorieSlider: UISlider!
    @IBOutlet weak var calories: UILabel!
    @IBOutlet weak var medications: UITextField!
    weak var img: UIImage!
    @IBOutlet weak var sleepStepper: UILabel!
    @IBOutlet weak var sleep: UILabel!
    //todo: implement camera to get uiimage
    
    @IBOutlet weak var vegetable: UISwitch!
    @IBOutlet weak var dairy: UISwitch!
    @IBOutlet weak var protein: UISwitch!
    @IBOutlet weak var grains: UISwitch!
    @IBOutlet weak var fruits: UISwitch!
    @IBOutlet weak var other: UISwitch!
    
    var vegetableSelected = false
    var dairySelected = false
    var proteinSelected = false
    var grainsSelected = false
    var fruitsSelected = false
    var otherSelected = false
    var calorieCount: Int = 2000
    var sleepCount: Int = 8
    @IBAction func vegetablesSwitched(_ sender: UISwitch) {
        if vegetable.isOn {
            vegetableSelected = false
            vegetable.setOn(false, animated:true)
        } else {
            vegetableSelected = true
            vegetable.setOn(true, animated:true)
        }
    }
    @IBAction func dairySwitched(_ sender: UISwitch) {
        if dairy.isOn {
            dairySelected = false
            dairy.setOn(false, animated:true)
        } else {
            dairySelected = true
            dairy.setOn(true, animated:true)
        }
    }
    @IBAction func proteinSwitched(_ sender: UISwitch) {
        if protein.isOn {
            proteinSelected = false
            protein.setOn(false, animated:true)
        } else {
            proteinSelected = true
            protein.setOn(true, animated:true)
        }
    }
    @IBAction func grainsSwitched(_ sender: UISwitch) {
        if grains.isOn {
            grainsSelected = false
            grains.setOn(false, animated:true)
        } else {
            grainsSelected = true
            grains.setOn(true, animated:true)
        }
    }
    @IBAction func fruitsSwitched(_ sender: UISwitch) {
        if fruits.isOn {
            fruitsSelected = false
            fruits.setOn(false, animated:true)
        } else {
            fruitsSelected = true
            fruits.setOn(true, animated:true)
        }
    }
    @IBAction func othersSwitched(_ sender: UISwitch) {
        if other.isOn {
            otherSelected = false
            other.setOn(false, animated:true)
        } else {
            otherSelected = true
            other.setOn(true, animated:true)
        }
    }
    
    let step: Float = 100
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let roundedValue = round(sender.value / step) * step
        sender.value = roundedValue
        calorieCount = Int(sender.value)
        calories.text = "\(calorieCount)"
    }
    
    @IBAction func sleepStepper(_ sender: UIStepper) {
        sleepCount = Int(sender.value)
        sleep.text = sleepCount.description
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
     @IBAction func submitDailyEntry(_ sender: UIButton) {
        //todo: change categories and medications to different data structure
        let db = Firestore.firestore()
        let date = Date()
        let day = String(date.description.prefix(10))
        let userID = Auth.auth().currentUser?.uid
        let documentName = day + ", " + userID!
        
        print("document name: " + documentName)
        db.collection("entryData").document(documentName).setData([
            "calories": calorieCount,
            "vegetables": vegetableSelected,
            "dairy": dairySelected,
            "protein": proteinSelected,
            "grains": grainsSelected,
            "fruits": fruitsSelected,
            "other": otherSelected,
            "medications": medications.text,
            "sleep": sleepCount,
            "acne": numAcne
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Entry data successfully written!")
            }
        }
        
        let alert = UIAlertController(
            title: "Entry Posted!",
            message: "",
            preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {
            (_)in
            self.performSegue(withIdentifier: "unwindToReport", sender: self)
        })
        
        alert.addAction(OKAction)
        self.present(alert, animated: true, completion: nil)
    }
}
