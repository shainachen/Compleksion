//
//  CameraViewController.swift
//  Complekshun
//
//  Created by Derek Hsiao on 4/18/19.
//  Copyright © 2019 iosdecal. All rights reserved.
//

import UIKit
import Firebase

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    var selfie: UIImage!
    
    @IBOutlet weak var acne: UISlider!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var acneCount: UILabel!
    var acneCountInteger: Int = 0
    
    @IBAction func acneValueChanged(_ sender: UISlider) {
        acneCountInteger = Int(sender.value)
        acneCount.text = "\(acneCountInteger)"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.invokeSelfie()
    }
    
    func invokeSelfie() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .camera
        picker.cameraDevice = .front
        self.present(picker, animated: false, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let info = info[UIImagePickerController.InfoKey.originalImage] as? UIImage, let optimizedImageData = info.jpegData(compressionQuality: 0.6) {
            self.selfie = info
            uploadProfileImage(imageData: optimizedImageData)
        }
        dismiss(animated: true, completion: nil)
    }
    
    func uploadProfileImage(imageData: Data)
    {
        let activityIndicator = UIActivityIndicatorView.init(style: .gray)
        activityIndicator.startAnimating()
        activityIndicator.center = self.view.center
        self.view.addSubview(activityIndicator)
        
        let date = Date();
        let day = String(date.description.prefix(10))
        
        let storageReference = Storage.storage().reference()
        let currentUser = Auth.auth().currentUser
        let storageLocation = currentUser!.uid + "-" + day + ".jpg"
        let profileImageRef = storageReference.child("users").child(currentUser!.uid).child(storageLocation)
        
        let uploadMetaData = StorageMetadata()
        uploadMetaData.contentType = "image/jpeg"
        
        profileImageRef.putData(imageData, metadata: uploadMetaData) { (uploadedImageMeta, error) in
            
            activityIndicator.stopAnimating()
            activityIndicator.removeFromSuperview()
            
            if error != nil
            {
                print("Error took place \(String(describing: error?.localizedDescription))")
                return
            } else {
                self.img.image = UIImage(data: imageData)
                
                print("Meta data of uploaded image \(String(describing: uploadedImageMeta))")
            }
        }
    }
    
    @IBAction func nextStep(_ sender: Any) {
        if selfie != nil {
            self.performSegue(withIdentifier: "toDailyEntries", sender: selfie)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDailyEntries" {
            if let dest = segue.destination as? DailyEntryController {
                dest.img = sender as? UIImage
                dest.numAcne = acneCountInteger
            }
        }
    }
}

