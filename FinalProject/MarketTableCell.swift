//
//  MarketTableCell.swift
//  FinalProject
//
//  Created by Hala Dalloul on 16/08/2026.
//

import UIKit

class MarketTableCell: UITableViewCell {
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var storeImage: UIImageView!
    
    @IBOutlet weak var storeText: UILabel!
    
    @IBOutlet weak var storeRateText: UILabel!
    
    
    func setUpStore (store:Store) {
        
        storeRateText.text = "\(store.rate)"
        storeText.text = store.name
        storeImage.image = UIImage(named: store.imageName)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        container.layer.cornerRadius = 10
    }
}
