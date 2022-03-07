//
//  ViewController.swift
//  BMI
//
//  Created by Starvian on 2022/3/5
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var resultNumLable: UILabel!
    @IBOutlet weak var resultLevelLabel: UILabel!
    @IBOutlet weak var gender: UISegmentedControl!
    
    @IBOutlet weak var inpHeight: UITextField!
    @IBOutlet weak var inpWeight: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func gender(_ sender: UISegmentedControl) {}

    @IBAction func calculate(_ sender: UIButton) {
        let w = Double(inpWeight.text!)
        let h = Double(inpHeight.text!)
        
        let bmi = ((w!) / ((h!)*(h!))) * 10000
        resultNumLable.text = String(format: "%.2f", bmi)
           switch gender.selectedSegmentIndex {
               
           case 0:
            if bmi < 18.5 {
                resultLevelLabel.text = "Underweight"}
            else if bmi > 18.5, bmi < 24.9 {
                resultLevelLabel.text = "Healthy weight"}
            else if bmi > 25.0, bmi < 29.9 {
                resultLevelLabel.text = "Overweight"}
            else if bmi > 30.0, bmi < 39.9{
                resultLevelLabel.text = "Obesity"}
            else{ resultLevelLabel.text = "Extreme Obesity"}
               
           case 1:
            if bmi < 18.5 {
                resultLevelLabel.text = "Underweight"}
            else if bmi > 18.5, bmi < 24.9 {
                resultLevelLabel.text = "Healthy weight"}
            else{ resultLevelLabel.text = "it's a secret" }

           default:
               print("Nothing")
           }
    }
}



