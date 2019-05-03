//
//  ViewController.swift
//  Complekshun
//
//  Created by Derek Hsiao on 4/9/19.
//  Copyright © 2019 iosdecal. All rights reserved.
//

import UIKit
import FirebaseUI
import Firebase
import ChameleonFramework

class ViewController: UIViewController {

    @IBOutlet weak var compleksion: UILabel!
    @IBOutlet weak var yourSkinsBestFriend: UILabel!
    @IBOutlet weak var enter: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        compleksion.textColor = ContrastColorOf(view.backgroundColor!, returnFlat: true)
        yourSkinsBestFriend.textColor = ContrastColorOf(view.backgroundColor!, returnFlat: true)
    enter.setTitleColor(ContrastColorOf(view.backgroundColor!, returnFlat: true), for: .normal)
        view.backgroundColor = GradientColor(UIGradientStyle.topToBottom, frame: UIScreen.main.bounds, colors: [FlatWatermelon(), FlatYellow()])
    }

    @IBAction func createAccount(_ sender: Any) {
        let authUI = FUIAuth.defaultAuthUI()
        authUI!.delegate = self
        let providers: [FUIAuthProvider] = [
            FUIEmailAuth()
        ]
        authUI!.providers = providers
        
        let authViewController = authUI!.authViewController()
        present(authViewController, animated: true, completion: nil)
    }
    
    
    @IBAction func login(_ sender: Any) {
        let authUI = FUIAuth.defaultAuthUI()
        authUI!.delegate = self
        let providers: [FUIAuthProvider] = [
            FUIEmailAuth()
        ]
        authUI!.providers = providers
        
        let authViewController = authUI!.authViewController()
        present(authViewController, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showTabView" {
            if let dest = segue.destination as? AllAboutYouController {
                dest.userID = Auth.auth().currentUser?.uid
            }
        }
    }
}

extension ViewController: FUIAuthDelegate{
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        if error != nil {
            // todo: log error
            return
        }
        let userID = Auth.auth().currentUser?.uid
        if authDataResult?.additionalUserInfo?.isNewUser == false {
            performSegue(withIdentifier: "loggedInSegue", sender: self)
        } else {
            performSegue(withIdentifier: "showTabView", sender: self)
        }
    }
    
}



