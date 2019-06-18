//
//  FruitsDetailViewController.swift
//  CartDemo
//
//  Created by HyperThink Systems on 13/06/19.
//  Copyright © 2019 Prithvi Raj. All rights reserved.
//

import UIKit

class FruitsDetailViewController: UIViewController {

    @IBOutlet weak var myButton: UIView!
    @IBOutlet weak var detailLabel: UILabel!
    
    var value: String!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("value is \(String(describing: value))")
         detailLabel.text = value ?? "mm"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
   
}
