//
//  Products.swift
//  CartDemo
//
//  Created by HyperThink Systems on 12/06/19.
//  Copyright © 2019 Prithvi Raj. All rights reserved.
//

import Foundation

struct Product: Codable, Equatable {
    
    var name: String
    var price: Int
}

extension Product {
    // MARK: Equatable
    static func ==(lhs: Product, rhs: Product) -> Bool {
        return lhs.name == rhs.name && lhs.price == rhs.price
    }
    
    func displayPrice() -> Int {
        return price
    }
}
