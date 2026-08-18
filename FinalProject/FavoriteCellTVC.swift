//
//  FavoriteCellTVC.swift
//  FinalProject
//
//  Created by Hala Dalloul on 18/08/2026.
//
 
import UIKit
 
class FavoriteCellTVC: UITableViewCell {
 
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var itemWight: UILabel!
    @IBOutlet weak var itemNewPrice: UILabel!
    @IBOutlet weak var itemOldPrice: UILabel!
    @IBOutlet weak var itemAddCartBTN: UIButton!
    @IBOutlet weak var itemLoveBTN: UIButton!
 
    // بترجع للـ VC رقم الصف اللي انضغط فيه أي زر، بدل ما نستخدم tag يدوي
    var onLoveTapped: (() -> Void)?
    var onAddCartTapped: (() -> Void)?
 
    override func awakeFromNib() {
        super.awakeFromNib()
        itemAddCartBTN.layer.cornerRadius = 20
        itemWight.layer.cornerRadius = 10
        itemWight.clipsToBounds = true
 
        itemAddCartBTN.addTarget(self, action: #selector(addCartPressed), for: .touchUpInside)
        itemLoveBTN.addTarget(self, action: #selector(lovePressed), for: .touchUpInside)
    }
 
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
 
    func configure(with item: FavoriteItem) {
        itemImage.image = UIImage(named: item.image) ?? UIImage(systemName: "photo")
        itemTitle.text = item.title
        itemWight.text = item.weight
        itemNewPrice.text = item.newPrice
 
        let attributeString = NSMutableAttributedString(string: item.oldPrice)
        attributeString.addAttribute(
            .strikethroughStyle,
            value: 2,
            range: NSMakeRange(0, attributeString.length)
        )
        itemOldPrice.attributedText = attributeString
    }
 
    @objc private func lovePressed() {
        onLoveTapped?()
    }
 
    @objc private func addCartPressed() {
        onAddCartTapped?()
    }
}
