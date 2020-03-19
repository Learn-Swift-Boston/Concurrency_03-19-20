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
        // TODO
    }

    static func getProduct(withId id: String, completion: @escaping (Result<Product, Error>) -> Void) {
        // TODO
    }

    static func getInventory(forProductWithId id: String, completion: @escaping (Result<Inventory, Error>) -> Void) {
        // TODO
    }

}
