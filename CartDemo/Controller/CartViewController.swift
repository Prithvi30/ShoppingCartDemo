//
//  CartViewController.swift
//  CartDemo
//
//  Created by HyperThink Systems on 12/06/19.
//  Copyright © 2019 Prithvi Raj. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var order: UIButton!
    
    var cart: Cart? = nil
    var quotes : [(key: String, value: Float)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cartTableView.delegate = self
        cartTableView.dataSource = self
        
        
        guard let total = cart?.total else { return }
        totalLabel.text = "Total : ₹\(total)"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func orderButton(_ sender: Any) {
        let alertController = UIAlertController(title: title, message: "Successfully Place Order", preferredStyle:UIAlertController.Style.alert)
        
        let cancelAction: UIAlertAction = UIAlertAction(title: "Done", style: .cancel) { action -> Void in
            //Just dismiss the action sheet
        }
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
   
}


extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return (cart?.items.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CartTableViewCell
        
        cell.selectionStyle = .none
        
        if let cartItem = cart?.items[indexPath.item] {
            cell.delegate = (self as CartItemDelegate)
            
            cell.productName.text = cartItem.product.name
            cell.price.text = "₹\(cartItem.product.displayPrice())"
            cell.quantityLabel.text = String(describing: cartItem.quantity)
            cell.quantity = cartItem.quantity
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125.0
    }
    
   
    
    
}

    


extension CartViewController: CartItemDelegate {
    
    // MARK: - CartItemDelegate
    func updateCartItem(cell: CartTableViewCell, quantity: Int) {
        guard let indexPath = cartTableView.indexPath(for: cell) else { return }
        guard let cartItem = cart?.items[indexPath.row] else { return }
        
        //Update cart item quantity
        cartItem.quantity = quantity
        
        //Update displayed cart total
        guard let total = cart?.total else { return }
        totalLabel.text = "Total Amount : \(total)"
    }
    
}
