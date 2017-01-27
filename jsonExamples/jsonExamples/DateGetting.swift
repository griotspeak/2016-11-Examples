//
//  DateGetting.swift
//  2017-01-26Test
//
//  Created by TJ Usiyan on 2017/01/26.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import Foundation

func getThingThatHasDate() {

    var shouldWait = true

    guard let url = URL(string: "https://dominique-tiy-game-tracker.herokuapp.com/games.json") else {
        fatalError()
    }
    let task = URLSession.shared.dataTask(with: url) { (optData, optResponse, optError) in
        if let data = optData,
            let objects = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [[String: Any]]  {

            let payload = objects[0]
            let rawDate = payload["testDate"] as! TimeInterval
            print("rawDate: \(rawDate)")
            let date = Date(timeIntervalSince1970: rawDate / 1000)
            print(date)
        } else {
            print("optResponse: \(String(describing: optResponse))")
            print("optData: \(String(describing: optData))")
        }

        shouldWait = false
    }


    task.resume()

    while shouldWait {
        
    }
}
