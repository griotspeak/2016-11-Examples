//
//  main.swift
//  take3_funcDisplayOrder
//
//  Created by TJ Usiyan on 2016/12/09.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

func getNumberFromUser(prompt: String) -> Int {
    print(prompt)
    var number: Int? = nil
    while number == nil {
        if let string = readLine(strippingNewline: true),
            let tempNum = Int(string) {
            number = tempNum
        } else {
            print("You didn't enter a number")
        }
    }

    return number!
}

for i in 1...3 {
    let number = getNumberFromUser(prompt: "Please enter number \(i):")
    print(number)
}

