//
//  ViewController.swift
//  midtermProject_Calculator
//
//  Created by Starvian Wibowo on 4/22/22.
//

import UIKit

class ViewController: UIViewController {

    lazy var calculator = theCalculator()
    
    
    @IBOutlet weak var labelRec: UILabel!
    @IBOutlet weak var labelRes: UILabel!
    
    @IBOutlet var buttonsOfOperands: [UIButton]!
    
    @IBOutlet var buttonsOfOperators: [UIButton]!
    
    @IBOutlet var buttonsofFunctions: [UIButton]!
    
    @IBOutlet var clearBtn: UIButton!
    
    @IBOutlet var equalBtn: UIButton!
    
    func setOperandBtnLayout() {
        for index in buttonsOfOperands.indices{
            let button = buttonsOfOperands[index]
            if(button.titleLabel?.text == "0") {
                button.layer.cornerRadius = 38
            } else {
                button.layer.cornerRadius = button.frame.width / 2
            }
        }
    }
    
    func setOperatorBtnLayout() {
        for index in buttonsOfOperators.indices{
            let button = buttonsOfOperators[index]
            button.layer.cornerRadius = button.frame.width / 2
        }
    }
    
    func setFuncBtnLayout() {
        for index in buttonsofFunctions.indices{
            let button = buttonsofFunctions[index]
            button.layer.cornerRadius = button.frame.width / 2
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setOperandBtnLayout()
        setOperatorBtnLayout()
        setFuncBtnLayout()
    }
    
    @IBAction func buttonsPress(_ sender: UIButton){
        for btn in buttonsOfOperators{
            if btn == sender {
                btn.setTitleColor(UIColor.systemOrange, for: .normal)
                btn.backgroundColor = UIColor.white
            }
            else {
                btn.setTitleColor(UIColor.white, for: .normal)
                btn.backgroundColor = UIColor.orange
            }
        }
    }
    
    @IBAction func operandPress(_ sender: UIButton) {
        if let operandPress =  sender.titleLabel?.text {
            calculator.processInputOperand(input: operandPress)
            clearBtn.setTitle("C", for: .normal)
            updateViewFromModel()
        }
    }
    
    
    @IBAction func optPress(_ sender: UIButton) {
        if let optPress =  sender.titleLabel?.text {
            calculator.processInputOperator(input: optPress)
        }
        
    }
        
    @IBAction func equalPress(_ sender: UIButton) {
        calculator.processInputEqual()
        for btn in buttonsOfOperators{
            btn.setTitleColor(UIColor.white, for: .normal)
            btn.backgroundColor = UIColor.orange
        }
        updateViewFromModel()
    }
    
    @IBAction func resetPress(_ sender: Any) {
        if clearBtn.title(for: .normal) == "AC"{
        for btn in buttonsOfOperators{
            btn.setTitleColor(UIColor.white, for: .normal)
            btn.backgroundColor = UIColor.orange
        }
        }
        
        if clearBtn.title(for: .normal) == "C"{
            calculator.currentOperand = "0"
            if calculator.history.isEmpty{
                calculator.currentOperand = "0"
                calculator.history.removeAll()
                calculator.reset()
                clearBtn.setTitle("AC", for: .normal)
            }
            else{
                clearBtn.setTitle("AC", for: .normal)
                if labelRes.text == "0"{
                    if labelRec.text != "÷" || labelRec.text != "×" || labelRec.text != "+" || labelRec.text != "-"{
                        calculator.history.removeLast()
                    }
                    calculator.reset()
                }
            }
        }
        
        
//        if clearBtn.title(for: .normal) == "C"{
//            if labelRes.text == "0"{
//                    calculator.history.removeLast()
//                }
//            }
        else{
            calculator.reset()
            clearBtn.setTitle("AC", for: .normal)
        }
        updateViewFromModel()
    }
    
    @IBAction func positiveNegativePress(_ sender: Any) {
        calculator.toggleSign()
        updateViewFromModel()
    }
    
    @IBAction func percentagePress(_ sender: Any) {
        calculator.percentage()
        updateViewFromModel()
    }
    
//    func afterEqualReset(){
//        if equalBtn.isTouchInside{
//            calculator.reset()
//            clearBtn.setTitle("AC", for: .normal)
//        }
//    }
    
    func updateViewFromModel() {
        labelRes.text = calculator.currentOperand
        labelRec.text = calculator.getHistory()
    }
//    @IBAction func clearPress(sender: Any){
//        if calculator.getHistory() == "\(0)" {
//
//        }
//    }
    
}
