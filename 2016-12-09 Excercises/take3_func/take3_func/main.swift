//
//  main.swift
//  take3_func
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

for _ in 0..<3 {
    let number = getNumberFromUser(prompt: "Please enter a number:")
    print(number)
}


enum Result {
    case success(Int)
    case failure
}

extension Result : Equatable {

    public static func ==(lhs:Result, rhs:Result) -> Bool {
        switch (lhs, rhs) {
        case (.success(let left), .success(let right)):
            return left == right
        case (.failure, .failure):
            return true
        case (.failure, .success), (.success, .failure):
            return false
        }
    }
}



let instance: Result = .success(3)

if case .success(let value) = instance {
    print("I like the number \(3) as well")
}
