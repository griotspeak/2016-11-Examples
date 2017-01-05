//
//  AppNetAPI.swift
//  Books
//
//  Created by TJ Usiyan on 2017/01/05.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import Foundation

internal struct AppNetAPI {
    internal enum Error: Swift.Error {
        case invalidJSONData
    }

    internal static let globalStreamURL: URL = URL(string: "https://api.app.net/posts/stream/global")!

    internal static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-DD'T'HH:mm:ssZ"
        let timeZoneName = TimeZone.abbreviationDictionary["UTC"]!
        let timeZone = TimeZone(identifier: timeZoneName)
        formatter.timeZone = timeZone
        return formatter
    }()

}
