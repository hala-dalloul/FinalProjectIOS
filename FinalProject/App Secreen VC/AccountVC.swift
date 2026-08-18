
//  AccountVC.swift
//  FinalProject
//
//  Created by Hala Dalloul on 17/08/2026.
//

import UIKit

class AccountVC: UIViewController, UITableViewDataSource {
    

    
    @IBOutlet weak var settingsTV: UITableView!
    
    @IBOutlet weak var logOutBTN: UIButton!
    var sections: [[SettingsItem]] = [
        [SettingsItem(prefixIcon: UIImage(named:"ic_profile"), title: "Profile data", subtitle: "edit profile data", suffixIcon: UIImage(systemName: "chevron.right")),
            SettingsItem(prefixIcon: UIImage(named: "ic_lock"), title: "edit password", subtitle: "Create new password", suffixIcon: UIImage(systemName: "chevron.right")),
            SettingsItem(prefixIcon: UIImage(named: "ic_eng_lang"), title: "App Language", subtitle: "Change lahguage to English", suffixIcon: UIImage(named: "ic_eng_lang"))
        ],
        [
            SettingsItem(prefixIcon: UIImage(named: "ic_bucket"), title: "Login as Buyer in the app", subtitle: "Create your marcket", suffixIcon: UIImage(systemName: "chevron.right"))
        ],
        [
            SettingsItem(prefixIcon: UIImage(named: "ic_notifi_alarm"), title: "Rcive Notification", subtitle: "Activate notifications for requests", suffixIcon: UIImage(named: "switch_off"))
        ],
        [
            SettingsItem(prefixIcon: UIImage(named: "ic_profile"), title: "Conntect Us", subtitle: "Suggestions and complaints", suffixIcon: UIImage(systemName: "chevron.right")),
            
            SettingsItem(prefixIcon: UIImage(named: "ic_question"), title: "Common Questions", subtitle:nil, suffixIcon: UIImage(systemName: "chevron.right")),
            
            SettingsItem(prefixIcon: UIImage(named: "ic_about"), title: "About Us", subtitle:nil, suffixIcon: UIImage(systemName: "chevron.right")),
            
            SettingsItem(prefixIcon: UIImage(named: "ic_terms"), title: "Trems & Conditions", subtitle:nil, suffixIcon: UIImage(systemName: "chevron.right")),
        ],
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        settingsTV.layer.cornerRadius = 20
        logOutBTN.layer.cornerRadius = 20
        settingsTV.separatorStyle = .none
        settingsTV.showsVerticalScrollIndicator = false
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = sections[indexPath.section][indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath) as! PersonInfoTVC
        cell.configure (prefixIcon: item.prefixIcon, title: item.title, subtitle: item.subtitle, siffixIcon: item.suffixIcon)
        return cell
    }
    
}
struct SettingsItem {
    let prefixIcon: UIImage?
    let title: String
    let subtitle: String?
    let suffixIcon: UIImage?
}

extension AccountVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 8 : 10
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let isFirst = indexPath.row == 0
           let isLast = indexPath.row == sections[indexPath.section].count - 1
           cell.contentView.backgroundColor = .white
           cell.contentView.layer.cornerRadius = 14
           cell.contentView.layer.maskedCorners = []
           if isFirst { cell.contentView.layer.maskedCorners.insert([.layerMinXMinYCorner, .layerMaxXMinYCorner]) }
           if isLast { cell.contentView.layer.maskedCorners.insert([.layerMinXMaxYCorner, .layerMaxXMaxYCorner]) }
           cell.contentView.layer.masksToBounds = true
           
           cell.backgroundColor = .clear
           cell.selectionStyle = .none
           
           cell.layer.shadowColor = UIColor.black.cgColor
           cell.layer.shadowOpacity = 0.2
           cell.layer.shadowOffset = CGSize(width: 0, height: 3)
           cell.layer.shadowRadius = 6
           cell.layer.masksToBounds = false
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        _ = sections[indexPath.section][indexPath.row]
        // navigate to relevant screen
    }
}
