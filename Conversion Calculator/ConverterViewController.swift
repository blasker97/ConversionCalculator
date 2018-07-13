//
//  ConverterViewController.swift
//  Conversion Calculator
//
//  Created by Brian Lasker on 7/13/18.
//  Copyright © 2018 Brian Lasker. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {
   
    var conversionOptions = [Convert(label : "fahrenheit to celcius", input : "°F", output : "°C"),
                             Convert(label : "celcius to fahrenheit", input : "°C", output : "°F"),
                             Convert(label : "miles to kilometers", input : "mi", output : "km"),
                             Convert(label : "kilometers to miles", input : "km", output : "mi")]
    
    @IBOutlet weak var inputDisplay: UITextField!
    @IBOutlet weak var outputDisplay: UITextField!
    
    @IBAction func convertButton(_ sender: Any) {
        let alert = UIAlertController(title: "", message: "Choose Converter", preferredStyle: UIAlertControllerStyle.actionSheet)
        alert.addAction(UIAlertAction(title: conversionOptions[0].label, style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.inputDisplay.text = self.conversionOptions[0].input
            self.outputDisplay.text = self.conversionOptions[0].output
        }))
        alert.addAction(UIAlertAction(title: conversionOptions[1].label, style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.inputDisplay.text = self.conversionOptions[1].input
            self.outputDisplay.text = self.conversionOptions[1].output
        }))
        alert.addAction(UIAlertAction(title: conversionOptions[2].label, style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.inputDisplay.text = self.conversionOptions[2].input
            self.outputDisplay.text = self.conversionOptions[2].output
        }))
        alert.addAction(UIAlertAction(title: conversionOptions[3].label, style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.inputDisplay.text = self.conversionOptions[3].input
            self.outputDisplay.text = self.conversionOptions[3].output
        }))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputDisplay.text = conversionOptions[0].input
        outputDisplay.text = conversionOptions[0].output
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
