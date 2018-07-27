//
//  ConverterViewController.swift
//  Conversion Calculator
//
//  Created by Brian Lasker on 7/13/18.
//  Copyright © 2018 Brian Lasker. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {
    
    var currentConversion = Convert(label : "fahrenheit to celsius", inputUnit : "°F", outputUnit : "°C", inputNum : nil, outputNum : nil, isDecimal : false, decimalPlace : 1)
    
    
    @IBOutlet weak var inputDisplay: UITextField!
    @IBOutlet weak var outputDisplay: UITextField!
    
    @IBAction func signButton(_ sender: Any) {
        currentConversion.flipSign()
        update()
    }
    @IBAction func clearButton(_ sender: Any) {
        currentConversion.clear()
        update()
    }
    @IBAction func decimalButton(_ sender: Any) {
        if currentConversion.inputNum != nil && currentConversion.isDecimal != true {
            currentConversion.isDecimal = true
            self.inputDisplay.text = "\(currentConversion.inputNum!.cleanValue). \(currentConversion.inputUnit)"
        }
    }
    @IBAction func zeroButton(_ sender: Any) {
        currentConversion.addNumber(0)
        update()
    }
    @IBAction func oneButton(_ sender: Any) {
        currentConversion.addNumber(1)
        update()
    }
    @IBAction func twoButton(_ sender: Any) {
        currentConversion.addNumber(2)
        update()
    }
    @IBAction func threeButton(_ sender: Any) {
        currentConversion.addNumber(3)
        update()
    }
    @IBAction func fourButton(_ sender: Any) {
        currentConversion.addNumber(4)
        update()
    }
    @IBAction func fiveButton(_ sender: Any) {
        currentConversion.addNumber(5)
        update()
    }
    @IBAction func sixButton(_ sender: Any) {
        currentConversion.addNumber(6)
        update()
    }
    @IBAction func sevenButton(_ sender: Any) {
        currentConversion.addNumber(7)
        update()
    }
    @IBAction func eightButton(_ sender: Any) {
        currentConversion.addNumber(8)
        update()
    }
    @IBAction func nineButton(_ sender: Any) {
        currentConversion.addNumber(9)
        update()
    }
    
    func update() {
        let inputFormatter = NumberFormatter()
        inputFormatter.minimumFractionDigits = currentConversion.decimalPlace
        
        let outputFormatter = NumberFormatter()
        outputFormatter.maximumFractionDigits = 4

        if let inputNumber = currentConversion.inputNum {
            currentConversion.convert()
            if currentConversion.isDecimal == true {
                self.inputDisplay.text = "\(inputFormatter.string(for: inputNumber) ?? "") \(currentConversion.inputUnit)"
                self.outputDisplay.text = "\(outputFormatter.string(for: currentConversion.outputNum!) ?? "") \(currentConversion.outputUnit)"
                currentConversion.decimalPlace += 1
            } else {
                self.inputDisplay.text = "\(inputNumber.cleanValue) \(currentConversion.inputUnit)"
                self.outputDisplay.text = "\(outputFormatter.string(for: currentConversion.outputNum!) ?? "") \(currentConversion.outputUnit)"
            }
        } else {
            self.inputDisplay.text = "\(currentConversion.inputUnit)"
            self.outputDisplay.text = "\(currentConversion.outputUnit)"
        }
    }
    
    @IBAction func convertButton(_ sender: Any) {
        let alert = UIAlertController(title: "", message: "Choose Converter", preferredStyle: UIAlertControllerStyle.actionSheet)
        alert.addAction(UIAlertAction(title: "fahrenheit to celsius", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.currentConversion.label = "fahrenheit to celsius"
            self.currentConversion.inputUnit = "°F"
            self.currentConversion.outputUnit = "°C"
            if self.currentConversion.isDecimal == true {
                self.currentConversion.decimalPlace -= 1
            }
            self.update()
        }))
        alert.addAction(UIAlertAction(title: "celsius to fahrenheit", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.currentConversion.label = "celsius to fahrenheit"
            self.currentConversion.inputUnit = "°C"
            self.currentConversion.outputUnit = "°F"
            if self.currentConversion.isDecimal == true {
                self.currentConversion.decimalPlace -= 1
            }
            self.update()
        }))
        alert.addAction(UIAlertAction(title: "miles to kilometers", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.currentConversion.label = "miles to kilometers"
            self.currentConversion.inputUnit = "mi"
            self.currentConversion.outputUnit = "km"
            if self.currentConversion.isDecimal == true {
                self.currentConversion.decimalPlace -= 1
            }
            self.update()
        }))
        alert.addAction(UIAlertAction(title: "kilometers to miles", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.currentConversion.label = "kilometers to miles"
            self.currentConversion.inputUnit = "km"
            self.currentConversion.outputUnit = "mi"
            if self.currentConversion.isDecimal == true {
                self.currentConversion.decimalPlace -= 1
            }
            self.update()
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension Double {
    var cleanValue: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0lf", self) : String(self)
    }
}
