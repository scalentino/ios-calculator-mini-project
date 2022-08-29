//
//  ViewController.swift
//  calculator
//
//  Created by Consultant on 8/19/22.
//

import UIKit

class ViewController: UIViewController
{

    @IBOutlet weak var calculatorWorkings: UILabel!
    @IBOutlet weak var calculatorResults: UILabel!
    
    var workings:String = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func clearAll()
    {
        workings = ""
        calculatorWorkings.text = ""
        calculatorResults.text = ""
    }
    
    @IBAction func AllClearTap(_ sender: Any)
    {
        clearAll()
    }
    
    
    @IBAction func equalsTap(_ sender: Any) {
        if(validInput())
                {
                    let checkedWorkingsForPercent = workings.replacingOccurrences(of: "%", with: "*0.01")
                    let expression = NSExpression(format: checkedWorkingsForPercent)
                    let result = expression.expressionValue(with: nil, context: nil) as! Double
                    let resultString = formatResult(result: result)
                    calculatorResults.text = resultString
                }
                else
                {
                    let alert = UIAlertController(
                        title: "Invalid Input",
                        message: "Calculator unable to do math based on input",
                        preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Okay", style: .default))
                    self.present(alert, animated: true, completion: nil)
                }
            }
            
            func validInput() ->Bool
            {
                var count = 0
                var funcCharIndexes = [Int]()
                
                for char in workings
                {
                    if(specialCharacter(char: char))
                    {
                        funcCharIndexes.append(count)
                    }
                    count += 1
                }
                
                var previous: Int = -1
                
                for index in funcCharIndexes
                {
                    if(index == 0)
                    {
                        return false
                    }
                    
                    if(index == workings.count - 1)
                    {
                        return false
                    }
                    
                    if (previous != -1)
                    {
                        if(index - previous == 1)
                        {
                            return false
                        }
                    }
                    previous = index
                }
                
                return true
            }
            
            func specialCharacter (char: Character) -> Bool
            {
                if(char == "*")
                {
                    return true
                }
                if(char == "/")
                {
                    return true
                }
                if(char == "+")
                {
                    return true
                }
                return false
            }
            
            func formatResult(result: Double) -> String
            {
                if(result.truncatingRemainder(dividingBy: 1) == 0)
                {
                    return String(format: "%.0f", result)
                }
                else
                {
                    return String(format: "%.2f", result)
                }
    }
    
  
    
    func addToWorkings(value: String)
    {
        workings = workings + value
        calculatorWorkings.text = workings
    }
    
    @IBAction func PearcentTap(_ sender: Any) {
        addToWorkings(value: "%")
    }
    
    
    @IBAction func DivisionTap(_ sender: Any) {
        addToWorkings(value: "/")
    }
    
    
    @IBAction func TimesTap(_ sender: Any) {
        addToWorkings(value: "*")
    }
    
    
    @IBAction func SubtractTap(_ sender: Any) {
        addToWorkings(value: "-")
    }
    
    
    @IBAction func PlusTap(_ sender: Any) {
        addToWorkings(value: "+")
    }
    
    
    @IBAction func DotTap(_ sender: Any) {
        addToWorkings(value: ".")
    }
    
    
    @IBAction func ZeroTap(_ sender: Any) {
        addToWorkings(value: "0")
    }
    
    
    @IBAction func NineTap(_ sender: Any) {
        addToWorkings(value: "9")
    }
    
    
    @IBAction func EightTap(_ sender: Any) {
        addToWorkings(value: "8")
    }
    
    
    @IBAction func SevenTap(_ sender: Any) {
        addToWorkings(value: "7")
    }
    
    
    @IBAction func SixTap(_ sender: Any) {
        addToWorkings(value: "6")
    }
    
    
    @IBAction func FiveTap(_ sender: Any) {
        addToWorkings(value: "5")
    }
    
    
    @IBAction func FourTap(_ sender: Any) {
        addToWorkings(value: "4")
    }
    
    
    @IBAction func ThreeTap(_ sender: Any) {
        addToWorkings(value: "3")
    }
    
    
    @IBAction func twoTap(_ sender: Any) {
        addToWorkings(value: "2")
    }
    
    
    @IBAction func OneTap(_ sender: Any) {
        addToWorkings(value: "1")
    }
    
    @IBAction func PlusMinus(_ sender: Any) {
        if Float(calculatorWorkings.text!)! - Float(Int(calculatorWorkings.text!)!) == 0.0 {
            
            calculatorWorkings.text = String(Int(calculatorWorkings.text!)! * -1)
            
        } else {
            
            calculatorWorkings.text = String(Float(calculatorWorkings.text!)! * -1)
            
        }
    }
}

