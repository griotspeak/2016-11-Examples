//
//  PetitionStore.swift
//  GovModel
//
//  Created by TJ Usiyan on 2017/01/17.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import Foundation

enum Result<Payload> {
    case success(Payload)
    case failure(Swift.Error)
}

final class PetitionStore {
    enum Error : Swift.Error {
        case httpError(URLResponse)
    }

    var petitions: [Petition] = []

    func fetchPetitions(_ completion: @escaping (Result<[Petition]>) -> Void) {
        let url = WhitehouseAPI(base: WhitehouseAPI.baseURL).fullURL(method: .allEconomyFacts)
        let task = URLSession.shared.dataTask(with: url) { (optionalData, optionalResponse, optionalError) in
            if let data = optionalData,
                let array = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [[String:Any]] {
                print(String(bytes: data, encoding: .utf8)!)
                completion(.success(array.flatMap(Petition.init(jsonObject:))))
            } else if let response = optionalResponse {
                completion(.failure(Error.httpError(response)))
            } else {
                completion(.failure(optionalError!))
            }
        }

        task.resume()
    }
}
