//
//  Login.swift
//  SwiftAquiteturas
//
//  Created by ALYSSON DODO on 24/11/22.
//
import UIKit
import Foundation

class LoginViewController : UIViewController {
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var entrarButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func tappedEntrarButton(_ sender: UIButton) {
        let manager = UserManager(business: UserBusiness())
        
        if let email = emailTextField.text,
           let password = passwordTextField.text{
            manager.login(email: email, password: password){
                userModel in
                self.openHomeView()
            } failureHandler: { error in
                self.showMessage(title: "Error", message: error.localizedDescription)
            }
        }
    }
    func showMessage(title : String, message : String){
        let alert = UIAlertController(
            title: title,
            message : message,
            preferredStyle: .alert)
        alert.addAction(UIAlertAction( title: "OK", style: UIAlertAction.Style.default, handler : nil))
        self.present( alert, animated:  true )
    }
    
    @IBAction func tappedRegister(_ sender: UIButton) {
        let registerView = storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController
        
        registerView?.modalPresentationStyle = .fullScreen
        self.present(registerView ?? UIViewController(), animated: true)
    }
    
    func openHomeView(){
        let homeView = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        homeView.modalPresentationStyle = .fullScreen
        self.present( homeView, animated:  true)
    }
}




