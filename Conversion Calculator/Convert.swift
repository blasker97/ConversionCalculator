//
//  Convert.swift
//  Conversion Calculator
//
//  Created by Brian Lasker on 7/13/18.
//  Copyright © 2018 Brian Lasker. All rights reserved.
//

import UIKit

struct Convert {
    var label : String
    var inputUnit : String
    var outputUnit : String
    var inputNum : Double?
    var outputNum : Double?
    var isDecimal : Bool
    var decimalPlace : Int
    
    mutating func addNumber (_ number : Double) {
        if inputNum != nil {
            
            var tempInput = inputNum!
            
            if isDecimal == false {
                if tempInput >= 0 {
                    tempInput = tempInput * 10 + number
                    inputNum? = tempInput
                }
                
                if tempInput < 0 {
                    tempInput = tempInput * 10 - number
                    inputNum? = tempInput
                }
            } else {
                if tempInput >= 0 {
                    tempInput = tempInput + number / pow(10,Double(decimalPlace))
                    inputNum? = tempInput
                }
                
                if tempInput < 0 {
                    tempInput = tempInput - number / pow(10,Double(decimalPlace))
                    inputNum? = tempInput
                }
            }
        } else {
            inputNum = number
        }
    }
    
    mutating func clear() {
        inputNum = nil
        outputNum = nil
        isDecimal = false
        decimalPlace = 1
    }
    
    mutating func flipSign() {
        if inputNum != nil && inputNum != 0 {
            inputNum = inputNum! * (-1)
        }
        if isDecimal == true {
            decimalPlace -= 1
        }
    }
    
    mutating func convert() {
        switch self.label {
        case "fahrenheit to celsius":
            outputNum = (inputNum! - 32) * 5/9
        case "celsius to fahrenheit":
            outputNum = inputNum! * (9/5) + 32
        case "miles to kilometers":
            outputNum = inputNum! * 1.609344
        case "kilometers to miles":
            outputNum = inputNum! / 1.609344
        default:
            break
        }
    }
    
}

