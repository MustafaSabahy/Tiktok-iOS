//
//  DatabaseManager.swift
//  Tiktok
//
//  Created by mustafa sabahy on 02/07/2022.
//

import Foundation
import  FirebaseDatabase

final class DatabaseManager{
    
    
    public static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
    private init(){}
    
    public func getAllUsers(completion: ([String]) -> Void){
        
    }
    
}
