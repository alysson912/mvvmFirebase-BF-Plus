//
//  LoginViewController.swift
//  SwiftAquiteturas
//
//  Created by ALYSSON DODO on 25/11/22.
//

import UIKit

class LoginViewController: UIViewController {

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
    }
    
    @IBAction func tappedSignButton(_ sender: Any) {
    }
    
    
    @IBAction func tappedRegisterButton(_ sender: UIButton) {
    }
    
}

extension LoginViewController : UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing")
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn")
        return true
        
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")
    }
}
