//
//  Models.swift
//  GetStuff
//
//  Created by Zev Eisenberg on 3/8/20.
//  Copyright © 2020 Zev Eisenberg. All rights reserved.
//

struct Quote: Decodable {
    let quote: String
    let author: String
}

struct Product: Decodable {
    let id: String
    let name: String
    let imageUrlString: String
    let description: String
}

struct Stock: Decodable {
    let productId: String
    let stock: Int
}
