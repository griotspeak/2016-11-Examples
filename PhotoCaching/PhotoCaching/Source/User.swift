//
//  User.swift
//  PhotoCaching
//
//  Created by TJ Usiyan on 2017/01/25.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import UIKit

final class User : ImageKeyExtractable, ImageURLExtractable {
    var username: String
    var displayName: String
    var imageURL: URL?
    var imageKey: String

    init(username: String, displayName: String, imageURL: URL? = nil, imageKey: String = UUID().uuidString) {
        self.username = username
        self.displayName = displayName
        self.imageURL = imageURL
        self.imageKey = imageKey
    }

    var networkURL: URL? {
        return imageURL
    }
}
