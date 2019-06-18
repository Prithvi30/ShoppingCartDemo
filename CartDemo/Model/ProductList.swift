//
//  ProductList.swift
//  CartDemo
//
//  Created by HyperThink Systems on 12/06/19.
//  Copyright © 2019 Prithvi Raj. All rights reserved.
//

import Foundation

class ProductsListHelper {
    
    private let productsJson = """
        [
            {
                "name": "Mangos",
                "price": 95,
            },
            {
                "name": "Banana",
                "price": 210,
            },
            {
                "name": "Apple",
                "price": 130,
            },
            {
                "name": "Kiwi",
                "price": 73,
            },
            {
                "name": "Orange",
                "price": 73,
            },
            {
                "name": "Pineapple",
                "price": 95,
            },
            {
                "name": "WaterMelon",
                "price": 210,
            },
            {
                "name": "Papaya",
                "price": 130,
            },
            {
                "name": "Pomegranate",
                "price": 73,
            },
            {
                "name": "Chickoo",
                "price": 73,
            },
        ]

        """.data(using: .utf8)!
    
    func all() -> [Product] {
        let decoder = JSONDecoder()
        let products = try! decoder.decode([Product].self, from: productsJson)
        return products
    }
}
