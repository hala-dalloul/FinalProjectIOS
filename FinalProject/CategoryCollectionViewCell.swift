//
//  CategoryCollectionViewCell.swift
//  FinalProject
//
//  Created by Hala Dalloul on 16/08/2026.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var text: UILabel!
    
    @IBOutlet weak var imageContainer: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageContainer.layer.cornerRadius = 5
        imageContainer.layer.masksToBounds = true
    }
    
    func setUpCategoryCell (name:String, imageName:String) {
        text.text = name
        image.image = UIImage(named: imageName)
    
      
    }
    
    
    
    override var isSelected: Bool {
        
        
        didSet {
            imageContainer.backgroundColor = Const.praimaryColor
            imageContainer.tintColor = .white
            
        }
    }
    

}
