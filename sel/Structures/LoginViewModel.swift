//
//  LoginViewModel.swift
//  sel
//
//  Created by Fernando García on 28/09/23.
//

import Foundation

class LoginViewModel {
    var username: String = ""
    var password: String = ""
    @Published var isAuthenticated: Bool = false
    
    func Login() {
        
        let defaults = UserDefaults.standard
        
        Webservice().login(username: username, password: password) { result in
            switch result {
            case .success(let token):
                defaults.setValue(token, forKey: "jsonwebtoken")
                DispatchQueue.main.async {
                    self.isAuthenticated = true
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
