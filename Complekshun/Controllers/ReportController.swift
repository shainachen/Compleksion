//
//  ReportController.swift
//  Complekshun
//
//  Created by shaina on 4/23/19.
//  Copyright © 2019 iosdecal. All rights reserved.
//

import UIKit

class ReportController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var reportCollectionView: UICollectionView!
    
    @IBAction func unwindToReportController(segue:UIStoryboardSegue) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reportCollectionView.delegate = self
        reportCollectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as? ReportControllerCollectionViewCell {
            //  TODO: set cell to correct image        cell.ImagePickerImageView.image = UIImage(named: data.images[indexPath.item])

            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let dimension = self.reportCollectionView.frame.size.width;
        return CGSize(width: dimension, height: dimension)
        
    }
    
    
}
