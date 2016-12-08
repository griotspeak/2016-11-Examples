//
//  Tests.swift
//  Mirror
//
//  Created by TJ Usiyan on 2016/12/07.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

import Foundation

func runTests() {
    test(testName: "Truth!", condition: true, failureMessage: "WAT?")
}

func testInputFunction() {
    let state = State()
    let hasNoStringsInBeginning = state.strings.isEmpty
    state.append(text: "We hold these truths…")
    let hasOneStringAfterAppend = state.strings.count == 1
    test(testName: "addition of string",  condition: hasNoStringsInBeginning && hasOneStringAfterAppend, failureMessage: "that didn't go as expected")
}

func test(testName: String, condition: Bool, failureMessage: String) {
    if condition {
        print("\(testName) passed!")
    } else {
        print("\(testName) failed!: \(failureMessage)")
    }
}
