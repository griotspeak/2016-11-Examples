//
//  WhitehouseAPI.swift
//  GovModel
//
//  Created by TJ Usiyan on 2017/01/17.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import Foundation

struct WhitehouseAPI {
    static var baseURL: URL { return URL(string: "https://www.whitehouse.gov/")! }
    let base: URL

    init(base: URL) {
        self.base = base
    }

    enum Method {
        case allEconomyFacts

        var urlPathComponent: String {
            switch self {
            case .allEconomyFacts:
                return "facts/json/all/economy"
            }
        }

    }

    func fullURL(method: Method) -> URL {
        return base.appendingPathComponent(method.urlPathComponent)
    }
}






