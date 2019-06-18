//
//  ViewController.swift
//  CartDemo
//
//  Created by Prithvi Raj on 11/06/19.
//  Copyright © 2019 Prithvi Raj. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    var valueToPass:String!
    @IBOutlet weak var tableView: UITableView!
    

    var images = ["mango","banana","apple","kiwi","orange","pine","water","papaya","pome","chik"]

    
    fileprivate let products:[Product] = ProductsListHelper().all()
    fileprivate var cart = Cart()
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.rightBarButtonItem?.isEnabled = false
        self.navigationItem.rightBarButtonItem?.isEnabled = true
        
        
        cart.updateCart()
        

        
        
       self.navigationItem.rightBarButtonItem?.title = "Cart (\(cart.items.count))"
        tableView.reloadData()
    }
    
    
  

}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell
        
       cell?.selectionStyle = .none
        
        let product = products[indexPath.item]
        
        cell!.delegate = self
        cell!.name.text = product.name
        cell!.price.text = "₹\(product.displayPrice())"
        cell?.cartImage.image = UIImage(named: images[indexPath.row])
        cell!.setButton(state: self.cart.contains(product: product))
        
        return cell!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCart" {
            if let cartViewController = segue.destination as? CartViewController {
                cartViewController.cart = self.cart
            }
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
   
}



    
    



extension ViewController: CartDelegate {
    
    func updateCart(cell: TableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        
        let product = products[indexPath.row]
        
        cart.updateCart(with: product)
        
        self.navigationItem.rightBarButtonItem?.title = "Cart (\(cart.items.count))"

    }
    
    
    @objc func navigateToNextViewController(){
        self.performSegue(withIdentifier: "showCart", sender: self)
    }
  
    
}
extension UIView{
    func animationZoom(scaleX: CGFloat, y: CGFloat) {
        self.transform = CGAffineTransform(scaleX: scaleX, y: y)
    }
    
    func animationRoted(angle : CGFloat) {
        self.transform = self.transform.rotated(by: angle)
    }
}
