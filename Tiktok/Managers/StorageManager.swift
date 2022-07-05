//
//  StorageManager.swift
//  Tiktok
//
//  Created by mustafa sabahy on 02/07/2022.
//

import Foundation
import FirebaseStorage


final class StorageManager{
    
    
    public static let shared = StorageManager()
    
    private let database = Storage.storage().reference()
    
    private init(){}
    
    public func getVideoURL( with identifier: String , completion : (URL) -> Void){
        
    }
    
    
    public func uploadVideoURL (from url: URL){
        
    }
    
}

