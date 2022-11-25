//
//  RegisterViewController.swift
//  SwiftAquiteturas
//
//  Created by ALYSSON DODO on 24/11/22.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var registerLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var trueTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tappedRegisterButton(_ sender: Any) {
        if let email = emailTextField.text,
           let password = passwordTextField.text,
           let confirmPassword = trueTextField.text{
            
            if password != confirmPassword{
                showMessage(title: "Error", message: "Senhas não conferem")
                return
            }
            
            let manager = UserManager(business: UserBusiness())
            manager.register(
                email: email,
                password: password){
                    UserModel in
                    self.openHomeView()
                } failureHandler: { error in
                    self.showMessage(title: "Error", message: error.localizedDescription)
                }
        }
    }
    
    @IBAction func tappedLoginButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    func openHomeView(){
        let homeView = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        homeView.modalPresentationStyle = .fullScreen
        self.present( homeView, animated:  true)
    }
    
    func showMessage(title : String, message : String){
        let alert = UIAlertController(
            title: title,
            message : message,
            preferredStyle: .alert)
        alert.addAction(UIAlertAction( title: "OK", style: UIAlertAction.Style.default, handler : nil))
        self.present( alert, animated:  true )
    }
}
