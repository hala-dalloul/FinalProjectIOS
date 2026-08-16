//
//  Login.swift
//  FinalProject
//
//  Created by Hala Dalloul on 15/08/2026.
//

import UIKit

class Login: UIViewController {

    @IBOutlet weak var userNameTF: UITextField!
    
    @IBOutlet weak var userNameTFView: UIView!
    
    @IBOutlet weak var passwordTFView: UIView!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var login: UIButton!
    
    @IBOutlet weak var eyeShowPassword: UIButton!
    @IBAction func showPasswordBTN(_ sender: Any) {
        
        passwordTF.isSecureTextEntry.toggle()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userNameTFView.layer.cornerRadius = 30
        passwordTFView.layer.cornerRadius = 30
        login.layer.cornerRadius = 20
        
    }
    

}
extension Login: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch  textField{
        
        case userNameTF:
            userNameTFView.layer.borderColor = Const.praimaryColor?.cgColor
            userNameTFView.layer.borderWidth = 2

        case passwordTF:
            passwordTFView.layer.borderColor = Const.praimaryColor?.cgColor
            passwordTFView.layer.borderWidth = 2

        default:
            
        return
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch  textField{
        
        case userNameTF:
            userNameTFView.layer.borderWidth = 0
        case passwordTF:
            passwordTFView.layer.borderWidth = 0
            
        default:
            
        return
        }
    }
}
