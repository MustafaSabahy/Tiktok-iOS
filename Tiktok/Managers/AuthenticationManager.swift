//
//  AuthenticationManager.swift
//  Tiktok
//
//  Created by mustafa sabahy on 02/07/2022.
//

import Foundation
 import FirebaseAuth



final class AuthManager{
    
    
    public static let shared = AuthManager()
    
    private let database = AuthManager()
    private init(){}
    
    
    enum SignInMethod {
        
        case email
        case facebook
        case google
    }
    
    public func signIn(with method : SignInMethod){
        
    }
    
    public func signout(){
        
    }
}
