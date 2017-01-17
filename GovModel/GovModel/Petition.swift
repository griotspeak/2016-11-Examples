//
//  Petition.swift
//  GovModel
//
//  Created by TJ Usiyan on 2017/01/17.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

public struct Petition {
    public let title: String
    public init(title: String) {
        self.title = title
    }



    public init?(jsonObject: [String:Any]) {
        guard let title = jsonObject[Petition.titleJSONKey] as? String else {
            return nil
        }

        self.init(title: title)
    }
}

extension Petition : Equatable {
    public static func ==(lhs:Petition, rhs:Petition) -> Bool {
        return lhs.title == rhs.title
    }
}


extension Petition {
    static var titleJSONKey: String = "url_title"
}
