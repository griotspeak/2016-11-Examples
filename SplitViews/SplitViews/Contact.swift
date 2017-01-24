//
//  Contact.swift
//  SplitViews
//
//  Created by TJ Usiyan on 2017/01/24.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import Foundation

@objc class Contact : NSObject {
    var givenName: String
    var familyName: String
    init(givenName: String, familyName: String) {
        self.givenName = givenName
        self.familyName = familyName
    }
}

extension Contact {
    override var description: String {
        return fullName
    }
}

extension Contact {
    var nameComponents: PersonNameComponents {
        var comps = PersonNameComponents()
        comps.givenName = givenName
        comps.familyName = familyName
        return comps
    }
    var fullName: String {
        let formatter = PersonNameComponentsFormatter()
        return formatter.string(from: nameComponents)
    }
}
