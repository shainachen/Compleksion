//
//  CameraViewController.swift
//  Complekshun
//
//  Created by Derek Hsiao on 4/18/19.
//  Copyright © 2019 iosdecal. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {

    var selfie: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func selfie(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .camera
        self.present(picker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let info = info[UIImagePickerController.InfoKey.originalImage]
        self.selfie = info as? UIImage
        dismiss(animated: true, completion: nil)
    }
}


