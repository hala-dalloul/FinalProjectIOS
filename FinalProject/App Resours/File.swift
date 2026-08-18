//
//  File.swift
//  FinalProject
//
//  Created by Hala Dalloul on 11/08/2026.
//

import Foundation
import UIKit

class Const{
    static let appFontReguler = UIFont(name: "DINNextLTArabic-Regular", size: 20 )
    

    static let praimaryColor = UIColor.init(named: "Praimary")
    static let categoryColor = UIColor.init(named: "Category")
    
    
    static let categories = ["All", "Vegetables", "Snacks", "Meat","Vegetables", "Snacks", "Meat"]
    static let categories_img = ["ic_all", "broccoli", "food", "chicken", "broccoli", "food", "chicken"]

    static let favoriteItems: [ProductItem] = [
        ProductItem(image: "test_img", title: "item one", weight: "10kg",
                     newPrice: "99.7", oldPrice: "103.33"),
        ProductItem(image: "test_img", title: "item one", weight: "10kg",
                     newPrice: "99.7", oldPrice: "103.33"),
        ProductItem(image: "test_img", title: "item one", weight: "10kg",
                     newPrice: "99.7", oldPrice: "103.33"),
        ProductItem(image: "test_img", title: "item one", weight: "10kg",
                     newPrice: "99.7", oldPrice: "103.33"),
        ProductItem(image: "test_img", title: "item one", weight: "10kg",
                     newPrice: "99.7", oldPrice: "103.33"),
        ProductItem(image: "test_img", title: "item one", weight: "10kg",
                     newPrice: "99.7", oldPrice: "103.33")
    ]
}
