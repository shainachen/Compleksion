//
//  WeeklyReportController.swift
//  Complekshun
//
//  Created by shaina on 4/24/19.
//  Copyright © 2019 iosdecal. All rights reserved.
//

import UIKit
import Firebase
import Charts

class WeeklyReportController: UIViewController {
    @IBOutlet weak var barChartView: BarChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        barChartView.noDataText = "You must make at least seven entries of data to generate graph."
        
    }
    
    
}
