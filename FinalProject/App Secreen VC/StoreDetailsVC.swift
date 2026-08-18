//
//  StoreDetailsVCTableViewController.swift
//  FinalProject
//
//  Created by Hala Dalloul on 17/08/2026.
//

import UIKit

class StoreDetailsVC: UIViewController ,UITextViewDelegate,
                      UITableViewDataSource {
    @IBOutlet weak var itemsList: UITableView!
    @IBOutlet weak var categoryCollection: UICollectionView!
    
    var selectedItem = 0
    var store:Store?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = store?.name
        itemsList.rowHeight = 174
        itemsList.estimatedRowHeight = 0
    }
}

extension StoreDetailsVC :UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 90)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Const.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCollectionViewCell
        let name = Const.categories[indexPath.item]
        let img = Const.categories_img[indexPath.item]
        cell.setUpCategoryCell(name: name, imageName: img)
        
        if selectedItem == indexPath.item {
            cell.imageContainer.tintColor = .white
            cell.imageContainer.backgroundColor = Const.categoryColor
            
        }else {
            cell.imageContainer.tintColor = Const.praimaryColor
            cell.imageContainer.backgroundColor = Const.categoryColor
        }
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedItem = indexPath.item
    
        for cell in collectionView.visibleCells{
            
            let cell = cell as!  CategoryCollectionViewCell
            cell.imageContainer.backgroundColor = Const.categoryColor
            cell.image.tintColor = Const.praimaryColor
        }
        let cell = collectionView.cellForItem(at: indexPath )as! CategoryCollectionViewCell
        cell.imageContainer.backgroundColor = Const.praimaryColor
        cell.image.tintColor = .white
      
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Const.favoriteItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "FavoriteCellTVC",
            for: indexPath
        ) as? FavoriteCellTVC else {
            return UITableViewCell()
        }

        let item = Const.favoriteItems[indexPath.row]

        cell.configure(with: item)


        return cell
    }

   
    private func addToCart(_ item: ProductItem) {
        print("Added to cart: \(item.title)")
    }

}

