//
//  User+CoreDataClass.swift
//  AppNetApp
//
//  Created by TJ Usiyan on 2017/02/01.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import UIKit
import CoreData

@objc(User)
public class User: NSManagedObject {
    var image: UIImage?

    public override func awakeFromInsert() {
        super.awakeFromInsert()

        setPrimitiveValue(UUID().uuidString,  forKey:"imageKey")
    }

    static var entityName: String {
        return "User"
    }
}
