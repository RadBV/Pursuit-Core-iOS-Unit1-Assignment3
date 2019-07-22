//
//  main.swift
//  Calculator
//
//  Created by Radharani Ribas-Valongo on 7/22/19.
//  Copyright © 2019 Radharani Ribas-Valongo. All rights reserved.
//

import Foundation

var operations: ([String: (Double, Double) -> Double]) = ["+": { $0 + $1 },
                                                          "-": { $0 - $1 },
                                                          "*": { $0 * $1 },
                                                          "/": { $0 / $1 }]
print("do something")

var again = ""
var calculatorWorking = true

func calculator() {
    while calculatorWorking == true {
        var input = readLine()
        var calculation = ""
        var calculationNumbers: [Double] = []

            if let theInputUnwrapped = input {
                calculation += theInputUnwrapped
        }
        var calculationArray = calculation.components(separatedBy: " ")

        var doublesArray: [Double] = []
        var operatorSign = ""

        doublesArray.append(Double(calculationArray[0])!)
        doublesArray.append(Double(calculationArray[2])!)
        operatorSign = calculationArray[1]

        var reducedAnswer = 0.0
        func doOperator(x:[Double]) -> Double {
            for (key,value) in operations {
                if operatorSign == key {
                    reducedAnswer = x.reduce(0, value)
                }
            }
            return reducedAnswer
        }

        let answer = doOperator(x: doublesArray)
        
        let rightAnswers = ["the answer is probably \(answer), idk tho :/", "thine answer hast been revealeth. your lucky numbereth is \(answer)", "it's \(answer)", "u don't even know what \(calculation)? that's okay, i'm not good at math either. (it's \(answer))"]

        print(rightAnswers.randomElement()!)
        
        print("do you want to keep making me do your math? if yes, enter any character. if no, enter 'n'")
        
        if let continueAnswer = input {
            again = continueAnswer
            if again == "n" {
                break
            }
        }
    }
}

calculator()
