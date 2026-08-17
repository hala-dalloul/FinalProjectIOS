//
//  StoreDetailsVCTableViewController.swift
//  FinalProject
//
//  Created by Hala Dalloul on 17/08/2026.
//

import UIKit

class StoreDetailsVC: UIViewController {

    var store:Store?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = store?.name
    }
}
