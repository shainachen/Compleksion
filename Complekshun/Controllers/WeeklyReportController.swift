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
    @IBOutlet weak var pieChartView: PieChartView!
    @IBOutlet weak var sleepBarChartView: BarChartView!
    @IBOutlet weak var caloriesBarChartView: BarChartView!
    
    var days: [String]!
    let db = Firestore.firestore()
    var weeklyAcne = [Double]()
    override func viewDidLoad() {
        super.viewDidLoad()
        //hard-coded data retrieval for demo
        let userID = Auth.auth().currentUser?.uid
        let documentNames = ["2019-04-19, " + userID!, "2019-04-20, " + userID!, "2019-04-21, " + userID!, "2019-04-22, " + userID!, "2019-04-23, " + userID!, "2019-04-24, " + userID!, "2019-04-25, " + userID!]
        let acne = [8.0, 10.0, 11.0, 7.0, 6.0, 4.0, 2.0]
        let foods = ["Vegetables", "Fruits", "Dairy", "Protein", "Grains"]
        let foods2 = ["V", "F", "D", "P", "G"]
        let sleep = [8.0, 7.0, 6.0, 8.0, 8.5, 8.5, 9.0]
        let calories = [2345.0, 2543.0, 2567.0, 2431.0, 2391.0, 2340.0, 2343.0]
        let percentages = [34.2, 40.8, 5.0, 10.0, 10.0]
        
        var days = [String]()
        for d in documentNames {
//            weeklyAcne.append(readData(doc: d))
            days.append(String(String(d.prefix(10)).suffix(5)))
        }
//        print("days: ", days)
//        print("acne counts: ", weeklyAcne)
        setChart(dataPoints: days, values: acne)
        setSleepChart(dataPoints: days, values: sleep)
        setCaloriesChart(dataPoints: days, values: calories)
        setPieChart(dataPoints: foods2
            , values: percentages)
    }
    
    func readData(doc: String) -> Double {
        let docRef = db.collection("entryData").document(doc)
        var acne = -1.0
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data()
                self.weeklyAcne.append(dataDescription!["acne"]! as!
                    Double)
                print("data descrip", dataDescription!["acne"]!)
                acne = dataDescription!["acne"] as! Double
            } else {
                print("Document does not exist")
                acne = -1.0
            }
        }

        return acne
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
        barChartView.noDataText = "You must make at least seven entries of data to generate graph."
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(x: Double(i), y: values[i])
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "Weekly Acne Count")
        
        let chartData = BarChartData(dataSet: chartDataSet)
        barChartView.data = chartData
        chartDataSet.colors = ChartColorTemplates.liberty()
        barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
    }
    
    func setSleepChart(dataPoints: [String], values: [Double]) {
        sleepBarChartView.noDataText = "You must make at least seven entries of data to generate graph."
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(x: Double(i), y: values[i])
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "Weekly Sleep Tracker")
        
        let chartData = BarChartData(dataSet: chartDataSet)
        sleepBarChartView.data = chartData
        chartDataSet.colors = ChartColorTemplates.liberty()
        sleepBarChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
    }
    
    func setCaloriesChart(dataPoints: [String], values: [Double]) {
        caloriesBarChartView.noDataText = "You must make at least seven entries of data to generate graph."
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(x: Double(i), y: values[i])
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "Weekly Calorie Count")
        
        let chartData = BarChartData(dataSet: chartDataSet)
        caloriesBarChartView.data = chartData
        chartDataSet.colors = ChartColorTemplates.liberty()
        caloriesBarChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
    }
    
    func setPieChart(dataPoints: [String], values: [Double]) {
        
        var dataEntries: [ChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(x: Double(i), y: values[i])
            dataEntries.append(dataEntry)
        }
        
        let pieChartDataSet = PieChartDataSet(values: dataEntries, label: "Weekly Food Breakdown")
        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        pieChartView.data = pieChartData
        
        var colors: [UIColor] = []
        
        for i in 0..<dataPoints.count {
            let red = Double(arc4random_uniform(256))
            let green = Double(arc4random_uniform(256))
            let blue = Double(arc4random_uniform(256))
            
            let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
            colors.append(color)
        }
        pieChartDataSet.colors = colors
        pieChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
    }
}
