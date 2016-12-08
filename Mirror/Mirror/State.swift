//
//  State.swift
//  Mirror
//
//  Created by TJ Usiyan on 2016/12/08.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

class State {
    var strings: [String]
    init() {
        self.strings = []
    }

    func append(text: String) {
        strings.append(text)
    }

    func getAllText() {
        for i in 0..<5 {
            append(text: getText(prompt: "Please enter item \(i):"))
        }
    }

}

func getText(prompt: String) -> String {
    print(prompt)
    return readLine(strippingNewline: true)!
}


