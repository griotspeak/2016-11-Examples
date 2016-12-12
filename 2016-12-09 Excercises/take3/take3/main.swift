//
//  main.swift
//  take3
//
//  Created by TJ Usiyan on 2016/12/09.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

for _ in 0..<3 {
    print("Please give me a number:")
    if let string = readLine(strippingNewline: true),
        let number = Int(string) {
        print(number)
    } else {
        print("You didn't enter a number")
        fatalError()
    }
}
