//
//  LoginViewController.swift
//  SwiftAquiteturas
//
//  Created by ALYSSON DODO on 25/11/22.
//

import UIKit

class LoginViewController: UIViewController {
    let presenter : LoginPresenter = LoginPresenter()
    
    @IBOutlet weak var personLoginImageView: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!

 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLogin()
        
    }
    
    func setupLogin(){
        emailTextField.delegate = self
        passwordTextField.delegate = self
        presenter.delegate = self
    }
    
    @IBAction func tappedSignButton(_ sender: Any) {
        if let email = emailTextField.text ,
           let password = passwordTextField.text {
            
            let userModel = UserModel(email: email, password: password)
            presenter.login(userModel: userModel)
        }
    }
    
    @IBAction func tappedRegisterButton(_ sender: UIButton) {
        
    }
    
}

extension LoginViewController : LoginPresenterDelegate{
    func goHome() {
       
        let home = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        home.modalPresentationStyle = .fullScreen
        self.present( home , animated:  true)
    }
    
    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated : true, completion : nil)
    }
    
 
    
    
}

extension LoginViewController : UITextFieldDelegate{
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing")
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn")
        textField.resignFirstResponder()
        return true
        
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")
    }
}
