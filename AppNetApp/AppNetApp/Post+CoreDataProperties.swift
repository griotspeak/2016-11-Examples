//
//  Post+CoreDataProperties.swift
//  AppNetApp
//
//  Created by TJ Usiyan on 2017/02/01.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import Foundation
import CoreData


extension Post {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Post> {
        return NSFetchRequest<Post>(entityName: "Post");
    }

    @NSManaged public var createdAt: NSDate
    @NSManaged public var postID: String
    @NSManaged public var text: String
    @NSManaged public var user: User?

}
