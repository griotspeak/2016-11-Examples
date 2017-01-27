//
//  PostImage.swift
//  jsonExamples
//
//  Created by TJ Usiyan on 2017/01/26.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import UIKit

fileprivate var _fileName = "Ball"

func createBase64Request() -> URLRequest {
    guard let url = URL(string: "https://dominique-tiy-game-tracker.herokuapp.com/test-upload-string.json"),
        let image = UIImage(named: _fileName),
        let imageData = UIImageJPEGRepresentation(image, 1.0) else {
            fatalError()
    }

    let jsonObject = [
        "fileName" : "OutOfTouch.jpg",
        "fileString" : imageData.base64EncodedString()
    ]

    let jsonData = try! JSONSerialization.data(withJSONObject: jsonObject, options: [])

    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpBody = jsonData
    return request
}

func postImageAsString() {

    let request = createBase64Request()
    var keepRunning = true

    let priorImage = UIImage(named: _fileName)!
    let priorData = UIImageJPEGRepresentation(priorImage, 1.0)

    let task = URLSession.shared.dataTask(with: request) { (optionalData, optionalResponse, optionalError) in
        guard let data = optionalData,
            let object = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [String: Any] else {
                print("optionalResponse: \(String(describing: optionalResponse))")
                print("optionalError: \(String(describing: optionalError))")
                keepRunning = false
                return
        }

        guard let fileString = object["fileString"] as? String,
            let decoded = Data(base64Encoded: fileString),
            let image = UIImage(data: decoded) else {
                fatalError()
        }

        print("objects: \(object)")
        print("priorData == decoded: \(priorData == decoded)")
        print("priorImage.isEqual(image): \(priorImage.isEqual(image))")
        print(image)

        keepRunning = false
    }

    task.resume()

    while keepRunning {
    }
}
