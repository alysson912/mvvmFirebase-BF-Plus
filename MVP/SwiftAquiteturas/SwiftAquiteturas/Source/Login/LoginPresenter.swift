//
//  LoginPresenter.swift
//  SwiftAquiteturas
//
//  Created by ALYSSON DODO on 26/11/22.
//
import UIKit
import Foundation

protocol LoginPresenterDelegate{
    func  showMessage( title : String, message : String)
    func goHome()
}

class LoginPresenter{
    var delegate : LoginPresenterDelegate?
    
    func login ( userModel : UserModel){
        let manager = UserManager( business: UserBusiness())
        manager.login(email: userModel.email, password: userModel.password) {[weak self ] model in
        
            self?.goHome()
            
        } failureHandler : { [weak self ] error in
            self?.delegate?.showMessage(title: "error", message: error.localizedDescription)
        }
    }
    func goHome(){
        self.delegate?.goHome()
        
        
    }
}
