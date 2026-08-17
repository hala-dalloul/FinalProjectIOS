//
//  MainTabBarViewController.swift
//  FinalProject
//
//  Created by Hala Dalloul on 16/08/2026.
//

import UIKit

class MainTabBarViewController: UITabBarController, UITabBarControllerDelegate {

    private let indicator = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        setupTabBarAppearance()
        
        self.selectedIndex = 0
        setupTabBarIndicator()
       
        
        
    }
  
    
    private func setupTabBarAppearance() {
        
        let normalColor = #colorLiteral(
            red: 0.5921568627,
            green: 0.5921568627,
            blue: 0.5921568627,
            alpha: 1
        )
        
        let selectedColor = Const.praimaryColor ?? .systemBlue
        
        if #available(iOS 13.0, *) {
            
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .white
            
            // Unselected item
            appearance.stackedLayoutAppearance.normal.iconColor = normalColor
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
                .foregroundColor: normalColor,
                .font: UIFont.systemFont(ofSize: 11)
            ]
            
            // Selected item
            appearance.stackedLayoutAppearance.selected.iconColor = selectedColor
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = [
                .foregroundColor: selectedColor,
                .font: UIFont.systemFont(ofSize: 11)
            ]
            
            appearance.backgroundImage = UIImage()
            appearance.shadowImage = UIImage()
            
            tabBar.standardAppearance = appearance
            
        } else {
            
            // iOS 12.1 fallback
            tabBar.barTintColor = .white
            tabBar.backgroundColor = .white
            
            tabBar.tintColor = selectedColor
            tabBar.unselectedItemTintColor = normalColor
            
            tabBar.backgroundImage = UIImage()
            tabBar.shadowImage = UIImage()
            
            UITabBarItem.appearance().setTitleTextAttributes(
                [
                    .foregroundColor: normalColor,
                    .font: UIFont.systemFont(ofSize: 11)
                ],
                for: .normal
            )
            
            UITabBarItem.appearance().setTitleTextAttributes(
                [
                    .foregroundColor: selectedColor,
                    .font: UIFont.systemFont(ofSize: 11)
                ],
                for: .selected
            )
        }
    }
    
    
    private func setupTabBarIndicator() {
        indicator.backgroundColor = Const.praimaryColor
           indicator.layer.cornerRadius = 1.5
           tabBar.addSubview(indicator)
           updateIndicator(animated: false)
       }

       private func updateIndicator(animated: Bool) {
           guard let tabBarItems = tabBar.items else { return }
           let tabCount = CGFloat(tabBarItems.count)
           let tabWidth = tabBar.bounds.width / tabCount
           let tabHeight = tabBar.bounds.height

           let x = tabWidth * CGFloat(selectedIndex)
           let y: CGFloat = 0
           let width = tabWidth
           let height: CGFloat = 3

           let targetFrame = CGRect(x: x, y: y, width: width, height: height)

           if animated {
               UIView.animate(withDuration: 0.3) {
                   self.indicator.frame = targetFrame
               }
           } else {
               self.indicator.frame = targetFrame
           }
       }

       // Update when user selects a tab
       func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
           updateIndicator(animated: true)
       }

}
