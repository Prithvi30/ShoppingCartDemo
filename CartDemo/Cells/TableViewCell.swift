//
//  TableViewCell.swift
//  CartDemo
//
//  Created by Prithvi Raj on 11/06/19.
//  Copyright © 2019 Prithvi Raj. All rights reserved.
//

import UIKit

protocol CartDelegate {
    func updateCart(cell: TableViewCell)
}

class TableViewCell: UITableViewCell {

    @IBOutlet weak var innerVIew: UIView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var cartImage: UIImageView!
    @IBOutlet weak var addToCartButton: UIButton!
    
    var delegate: CartDelegate?
    var isOpen = true
    var customView = UIView()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        innerVIew.layer.cornerRadius = 5
        innerVIew.layer.borderWidth = 0.7
        innerVIew.layer.borderColor = UIColor.lightGray.cgColor
        price.layer.cornerRadius = 10.5
        price.layer.masksToBounds = true
        addToCartButton.layer.cornerRadius = 5
        addToCartButton.clipsToBounds = true
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setButton(state: Bool) {
        addToCartButton.isSelected = state
        addToCartButton.backgroundColor = (!addToCartButton.isSelected) ? .black : .red
    }
    
    
    
    @IBAction func addToCart(_ sender: Any) {
        setButton(state: !addToCartButton.isSelected)
        self.delegate?.updateCart(cell: self)
    }

}


