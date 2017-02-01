//
//  Post+CoreDataClass.swift
//  AppNetApp
//
//  Created by TJ Usiyan on 2017/02/01.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import Foundation
import CoreData

@objc(Post)
public class Post: NSManagedObject {
    static var entityName: String {
        return "Post"
    }
}
