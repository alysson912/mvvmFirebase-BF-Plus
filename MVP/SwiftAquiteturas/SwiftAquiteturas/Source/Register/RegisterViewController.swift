//
//  RegisterViewController.swift
//  SwiftAquiteturas
//
//  Created by ALYSSON DODO on 25/11/22.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var registerLabel: UILabel!
    @IBOutlet weak var personRegisterImageView: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmpassowordTextField: UITextField!
    
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configElementsRegister()
    }
    
    func configElementsRegister(){
        emailTextField.delegate = self
        passwordTextField.delegate = self
        confirmpassowordTextField.delegate = self
        
    }
 
    @IBAction func tappedRegisterButton(_ sender: Any) {
    }
    
}
extension RegisterViewController : UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("RegisterViewController")
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing")
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn")
        textField.resignFirstResponder()
        return true  
    }
}
