//
//  ShoppingCartVC.swift
//  FinalProject
//
//  Created by Hala Dalloul on 17/08/2026.
//

import UIKit

class ShoppingCartVC: UIViewController {

    @IBOutlet weak var shoppingCart: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        shoppingCart.layer.cornerRadius = 30
    }

    @IBAction func shoppingCartBTN(_ sender: Any) {
    }
}
