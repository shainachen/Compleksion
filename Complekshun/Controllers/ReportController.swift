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
            cell.text.insertText("hello")
            return cell
        }
        return UICollectionViewCell()
    }
    
    
}
