//
//  PersonInfoTVC.swift
//  FinalProject
//
//  Created by Hala Dalloul on 17/08/2026.
//

import UIKit

class PersonInfoTVC: UITableViewCell {

    @IBOutlet weak var perfixIcon: UIImageView!
    
    @IBOutlet weak var titleText: UILabel!
    
    @IBOutlet weak var descriptionText: UILabel!
    
    @IBOutlet weak var siffixIcon: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(prefixIcon: UIImage?, title: String, subtitle: String?,siffixIcon: UIImage?, iconTintColor: UIColor = .darkGray) {
        self.perfixIcon.image = prefixIcon
        self.perfixIcon.tintColor = iconTintColor
            
            titleText.text = title
            
            if let subtitle = subtitle, !subtitle.isEmpty {
                descriptionText.text = subtitle
                descriptionText.isHidden = false
            } else {
                descriptionText.text = nil
                descriptionText.isHidden = true
            }
            
        self.siffixIcon.image
= siffixIcon
        self.siffixIcon.tintColor = .lightGray
        }

}
