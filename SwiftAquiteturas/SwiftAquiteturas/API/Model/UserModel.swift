//
//  UserModel.swift
//  SwiftAquiteturas
//
//  Created by ALYSSON MENEZES on 21/11/22.
//

import Foundation

struct UserModel: Codable { // protocolo utilizado para codificar e decodificar dados do JSON
    let email : String
    let password : String
    
    init(){
        self.email = String() // estamos dizendo que email está vazia, para nao se preocupar se esta nulo ou n 
        self.password = String()
    }
    init(email: String, password: String){
        self.email = email
        self.password = password
    }
}
