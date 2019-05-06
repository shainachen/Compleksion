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
}

extension ReportController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageTile", for: indexPath) as! ImageTile
        let storage = Storage.storage()
        let gsReference = storage.reference(forURL: "gs://compleksion.appspot.com/users/")
        let reference = gsReference.child("nyAVk5dQiYcIpIMo6xH4UtPoDdN2/nyAVk5dQiYcIpIMo6xH4UtPoDdN2-2019-05-06.jpg")
        let placeholderImage = UIImage(named: "thinking")
        cell.image.sd_setImage(with: reference, placeholderImage: placeholderImage)
        print("jim")
        return cell
    }
}

extension ReportController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //add stuff here?
    }
}
