//
//  ViewController.swift
//  CalculatorUI
//
//  Created by Егор Астахов on 13.10.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var result: UILabel!
    
    var numberFromScreen: Double = 0
    var firstNum: Double = 0
    var operation: Double = 0
    var mathSign: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func digits(_ sender: UIButton) {
        if mathSign == true {
            result.text = String(sender.tag)
            mathSign = false
        } else {
            result.text = result.text! + String(sender.tag)
        }
        
        numberFromScreen = Double(result.text!)!
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if result.text != "" && sender.tag != 10 && sender.tag != 15 {
            firstNum = Double(result.text!)!
            
            if sender.tag == 11 { // Деление
                result.text = "/"
            } else if sender.tag == 12 { // Умножение
                result.text = "*"
            } else if sender.tag == 13 { // Вычитание
                result.text = "-"
            } else if sender.tag == 14 { // Добавление
                result.text = "+"
            }
            
            
            operation = Double(sender.tag)
            mathSign = true
        } else if sender.tag == 15 { // Посчитать все
            if operation == 11 {
                result.text = String(firstNum / numberFromScreen)
            } else if operation == 12 {
                result.text = String(firstNum * numberFromScreen)
            } else if operation == 13 {
                result.text = String(firstNum - numberFromScreen)
            } else if operation == 14 {
                result.text = String(firstNum + numberFromScreen)
            }
            
        } else if sender.tag == 10 {
            result.text = ""
            firstNum = 0
            numberFromScreen = 0
            operation = 0
        }
        
    }
    
}
