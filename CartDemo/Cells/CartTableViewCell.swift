//
//  CartTableViewCell.swift
//  CartDemo
//
//  Created by HyperThink Systems on 12/06/19.
//  Copyright © 2019 Prithvi Raj. All rights reserved.
//

import UIKit

protocol CartItemDelegate {
    func updateCartItem(cell: CartTableViewCell, quantity: Int)
}

class CartTableViewCell: UITableViewCell {

    @IBOutlet weak var cartView: UIView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var calculateView: UIView!
    @IBOutlet weak var decrease: UIButton!
    @IBOutlet weak var increase: UIButton!
    @IBOutlet weak var quantityLabel: UILabel!
    
    
    var delegate: CartItemDelegate?
    var quantity: Int = 1
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        calculateView.layer.cornerRadius = 5
        calculateView.layer.masksToBounds = true
        
        cartView.layer.cornerRadius = 5
        cartView.layer.borderWidth = 0.7
        cartView.layer.borderColor = UIColor.lightGray.cgColor
        cartView.clipsToBounds = true
        
        calculateView.layer.cornerRadius = 5
        calculateView.layer.borderWidth = 0.7
        calculateView.layer.borderColor = UIColor.lightGray.cgColor
        calculateView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

    
    @IBAction func updateCartItemQuantity(_ sender: Any) {
        if (sender as! UIButton).tag == 0 {
            quantity = quantity + 1
        } else if quantity > 0 {
            quantity = quantity - 1
        }
        
        decrease.isEnabled = quantity > 0
        decrease.backgroundColor = !decrease.isEnabled ? .red : .black
        
        self.quantityLabel.text = String(describing: quantity)
        self.delegate?.updateCartItem(cell: self, quantity: quantity)
    }

}
