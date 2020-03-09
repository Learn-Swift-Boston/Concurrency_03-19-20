//
//  APIClient.swift
//  GetStuff
//
//  Created by Zev Eisenberg on 3/8/20.
//  Copyright © 2020 Zev Eisenberg. All rights reserved.
//

import Foundation

enum APIClient {

    struct UnknownError: Error {
        let url: URL
        let response: URLResponse?
    }

    private static let baseURL = URL(string: "http://localhost:8080")!
    private static let decoder = JSONDecoder()

    static func getQuotes(completion: @escaping (Result<Quote, Error>) -> Void) {
        let url = baseURL.appendingPathComponent("quote")
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                completion(Result { try decoder.decode(Quote.self, from: data) })
            } else {
                completion(.failure(error ?? UnknownError(url: url, response: response)))
            }
        }.resume()
    }

}
