//
//  FavoriteVC.swift
//  FinalProject
//
//  Created by Hala Dalloul on 18/08/2026.
//

import UIKit

class FavoriteVC: UIViewController,
                   UITextViewDelegate,
                   UITableViewDataSource {

    @IBOutlet weak var itemsList: UITableView!

    var favoriteItems: [ProductItem] = [
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

    override func viewDidLoad() {
        super.viewDidLoad()
        itemsList.rowHeight = 174
        itemsList.estimatedRowHeight = 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "FavoriteCellTVC",
            for: indexPath
        ) as? FavoriteCellTVC else {
            return UITableViewCell()
        }

        let item = favoriteItems[indexPath.row]

        cell.configure(with: item)

        return cell
    }

}
