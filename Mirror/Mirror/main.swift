//
//  main.swift
//  Mirror
//
//  Created by TJ Usiyan on 2016/12/07.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

import Foundation

let arguments = Array(CommandLine.arguments.dropFirst())

//if (arguments.isEmpty == false) && arguments[0] == "--run-tests" {
    runTests()
//}

func uglyAskNumber() -> Int {
    var number: Int!

    while number == nil {
        if let string = readLine(strippingNewline: true) {
            if let validatedNumber = Int(string) {
                number = validatedNumber
            } else {
                print("Please enter a number using digits only.")
            }
        } else {
            print("Please enter a number using digits only.")
        }
    }

    return number!
}

func askNumber() -> Int {
    var number: Int!

    while number == nil {
        if let string = readLine(strippingNewline: true),
            let validatedNumber = Int(string) {
            number = validatedNumber
        } else {
            print("Please enter a number using digits only.")
        }
    }

    return number!
}
