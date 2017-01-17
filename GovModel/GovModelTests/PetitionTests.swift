//
//  PetitionTests.swift
//  GovModel
//
//  Created by TJ Usiyan on 2017/01/17.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import XCTest
import GovModel

class PetitionTests: XCTestCase {
    func testDeserialization() {
        let sourceString = "{\"category\":\"Economy\",\"uid\":\"153631\",\"body\":\"Strengthened trade relationships with countries around the world to help U.S. businesses boost their exports by 33.5% and support 1.2 million additional jobs since 2009.\",\"url\":\"\\/sites\\/default\\/files\\/docs\\/trade_and_exports_record.pdf\",\"url_title\":\"supporting trade and exports to create jobs\",\"type\":\"Progress\",\"path\":\"node\\/153637\"}"
        let sourceDictionary = try! JSONSerialization.jsonObject(with: sourceString.data(using: .utf8)!, options: []) as! [String:Any]
        let result = Petition(jsonObject: sourceDictionary)
        let expected: Petition = Petition(title: "supporting trade and exports to create jobs")
        XCTAssertEqual(result, expected)
    }
}
