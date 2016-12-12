//
//  main.swift
//  take3_noLoop
//
//  Created by TJ Usiyan on 2016/12/09.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

print("Please give me a number:")
guard let string0 = readLine(strippingNewline: true),
    let number0 = Int(string0)else {
        print("You didn't enter a number")
        fatalError()
}

print(string0)

print("Please give me a number:")
guard let string1 = readLine(strippingNewline: true),
    let number1 = Int(string1)else {
        print("You didn't enter a number")
        fatalError()
}

print(string1)

print("Please give me a number:")
guard let string2 = readLine(strippingNewline: true),
    let number2 = Int(string2)else {
        print("You didn't enter a number")
        fatalError()
}

print(string2)
