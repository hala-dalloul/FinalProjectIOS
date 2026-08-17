//
//  OrederVC.swift
//  FinalProject
//
//  Created by Hala Dalloul on 17/08/2026.
//

import UIKit

class OrederVC: UIViewController {

    @IBOutlet weak var currentOrdersBtn: UIButton!
    
    @IBOutlet weak var completedOrdersBtn: UIButton!
    
    @IBOutlet weak var indicatorView: UIView!
    
    @IBOutlet weak var mainText: UILabel!
    
    
    @IBAction func startShoppingBTN(_ sender: Any) {
        
    }
    @IBOutlet weak var startShopping: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialUI()
        startShopping.layer.cornerRadius = 30
        
        // Do any additional setup after loading the view.
    }
    

    private func setupInitialUI() {
            selectTab(isCurrent: true)
        }

        @IBAction func currentOrdersTapped(_ sender: UIButton) {
            selectTab(isCurrent: true)
        }

        @IBAction func completedOrdersTapped(_ sender: UIButton) {
            selectTab(isCurrent: false)
        }

        private func selectTab(isCurrent: Bool) {
            let activeColor = UIColor(red: 0.20, green: 0.78, blue: 0.75, alpha: 1.0)
            let inactiveColor = UIColor.darkGray

            currentOrdersBtn.setTitleColor(isCurrent ? activeColor : inactiveColor, for: .normal)
            completedOrdersBtn.setTitleColor(isCurrent ? inactiveColor : activeColor, for: .normal)

            let targetX = isCurrent ? 0 : completedOrdersBtn.frame.origin.x - currentOrdersBtn.frame.origin.x + 5

            UIView.animate(withDuration: 0.3) {
                self.indicatorView.transform = CGAffineTransform(translationX: targetX, y: 0)
                if(isCurrent){
                    self.mainText.text = "Not have Current Ordeds"
                }else{
                    self.mainText.text = "Not have Complete Order"
                }
            }
        }
}
