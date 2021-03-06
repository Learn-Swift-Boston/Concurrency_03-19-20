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

    // Represents an HTTP 404 error
    struct NotFoundError: Error {
        let url: URL
    }

    private static let localServerURL = URL(string: "http://localhost:8080")!
    private static let decoder = JSONDecoder()

    static func getQuotes(completion: @escaping (Result<Quote, Error>) -> Void) {
        let url = localServerURL.appendingPathComponent("quote")
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                completion(Result { try decoder.decode(Quote.self, from: data) })
            } else {
                completion(.failure(error ?? UnknownError(url: url, response: response)))
            }
        }.resume()
    }

    static func getProduct(withId id: String, completion: @escaping (Result<Product, Error>) -> Void) {
        let url = localServerURL
            .appendingPathComponent("product")
            .appendingPathComponent(id)

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                completion(Result { try decoder.decode(Product.self, from: data) })
            } else {
                completion(.failure(error ?? UnknownError(url: url, response: response)))
            }
        }.resume()
    }

    static func getInventory(forProductWithId id: String, completion: @escaping (Result<Inventory, Error>) -> Void) {
        let url = localServerURL
            .appendingPathComponent("inventory")
            .appendingPathComponent(id)

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                completion(Result { try decoder.decode(Inventory.self, from: data) })
            } else {
                completion(.failure(error ?? UnknownError(url: url, response: response)))
            }
        }.resume()
    }

}
