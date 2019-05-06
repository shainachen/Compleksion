//
//  ReportController.swift
//  Complekshun
//
//  Created by shaina on 4/23/19.
//  Copyright © 2019 iosdecal. All rights reserved.
//

import UIKit
import FirebaseStorage

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
}

extension ReportController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageTile", for: indexPath) as! ImageTile
        let storage = Storage.storage()
        let gsReference = storage.reference(forURL: "gs://compleksion.appspot.com/users/wDTxsJcoMiO19UKE3HyqQaVVmBD3")
        let reference = gsReference.child("1.jpeg")
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
