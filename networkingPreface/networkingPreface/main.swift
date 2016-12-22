//
//  main.swift
//  networkingPreface
//
//  Created by TJ Usiyan on 2016/12/22.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

import Foundation

var stayAlive = true

if let url = URL(string: "http://date.jsontest.com/") {
    let session = URLSession.shared

    let task = session.dataTask(with: url) { (optionalData, optionalResponse, optionalError) in
        if let data = optionalData,
            let string = String(data: data, encoding: .utf8),
            let jsonObject = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [String: Any],
            let dateString = jsonObject["date"] as? String {

            print(string)
            print("The date is \(dateString)")

        } else {
            print("response: \(optionalResponse)")
            print("error: \(optionalError)")
        }

        stayAlive = false
    }

    task.resume()


} else {
    print("why couldn't we create the URL?")
}


// terrible hack because we are a command line app
while stayAlive {
    
}
