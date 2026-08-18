//
//  Home.swift
//  FinalProject
//
//  Created by Hala Dalloul on 16/08/2026.
//

import UIKit

class Home: UIViewController {

    @IBOutlet weak var bottomArrow: UIButton!

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var bannerView: UIScrollView!

    var selectedItem = 0
    
    @IBOutlet weak var stores_tableview: UITableView!
    
        let stores: [Store] = [
        
        Store(imageName: "store", name: "Daily Mart", rate: 4.2),
        Store(imageName: "store", name: "Green Basket", rate: 4.8),
        Store(imageName: "store", name: "Snack World", rate: 3.9),
        Store(imageName: "image_placholder", name: "Fresh Market", rate: 2.5),
        Store(imageName: "store", name: "Daily Mart", rate: 4.2),
        Store(imageName: "store", name: "Green Basket", rate: 4.8),
        Store(imageName: "store", name: "Snack World", rate: 3.9),
        Store(imageName: "image_placholder", name: "Fresh Market", rate: 2.5),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bottomArrow.layer.cornerRadius = 6
        bannerView.layer.borderWidth = 0
       
    }
    

}

@available(iOS 13.0, *)
extension  Home : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoreCell") as! MarketTableCell
        cell.setUpStore(store: stores[indexPath.row])
        return cell

    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let st = UIStoryboard(name: "Main", bundle: nil)
        let vc = st.instantiateViewController(identifier: "StoreDetailsVC")  as!  StoreDetailsVC
        vc.store = stores[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
extension Home :UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
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
   
    
}
