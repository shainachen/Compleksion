//
//  ReportController.swift
//  Complekshun
//
//  Created by shaina on 4/23/19.
//  Copyright © 2019 iosdecal. All rights reserved.
//

import UIKit
import FirebaseStorage
import Firebase

class ImageTile: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
}

class ReportController: UIViewController {
    
    @IBOutlet weak var photoGrid: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoGrid.delegate = self
        photoGrid.dataSource = self
    }
    
    @IBAction func unwindToReportController(segue:UIStoryboardSegue) {
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("realoading")
        self.photoGrid.reloadData()
    }
}

extension ReportController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        let db = Firestore.firestore()
        var count = 0
        db.collection("entryData").getDocuments()
            {
                (querySnapshot, err) in
                
                if let err = err
                {
                    print("Error getting documents: \(err)");
                }
                else
                {
                    for document in querySnapshot!.documents {
                        count += 1
                        
                        print("\(document.documentID) => \(document.data())");
                    }
                    
                    print("Count = \(count)");
                }
        }
        print("Count = \(count)");
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("getting new cells")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageTile", for: indexPath) as! ImageTile
        cell.image.image = UIImage(named: "george")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //add stuff here?
    }
}
