//
//  CartItem.swift
//  CartDemo
//
//  Created by HyperThink Systems on 12/06/19.
//  Copyright © 2019 Prithvi Raj. All rights reserved.
//

import Foundation

class CartItem {
    
    var quantity : Int = 1
    var product : Product
    
    var subTotal : Float { get { return Float(product.price * Int(quantity)) } }
    
    init(product: Product) {
        self.product = product
    }
}
