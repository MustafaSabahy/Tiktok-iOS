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
    
    
    /// Storage bucket reference
    private let storageBucket = Storage.storage().reference()
    
    
    private let database = Storage.storage().reference()
    
    private init(){}
    
    /// Upload a new user video to firebase
    /// - Parameters:
    ///   - url: Local file url to video
    ///   - fileName: Desired video file upload name
    ///   - completion: Async callback result closure
    public func uploadVideo(from url: URL, fileName: String, completion: @escaping (Bool) -> Void) {
        guard let username = UserDefaults.standard.string(forKey: "username") else {
            return
        }

        storageBucket.child("videos/\(username)/\(fileName)").putFile(from: url, metadata: nil) { _, error in
            completion(error == nil)
        }
    }
    
    public func getVideoURL( with identifier: String , completion : (URL) -> Void){
        
    }
    
    
    public func uploadVideoURL (from url: URL){
        
    }
    
    
    
    public func generateVideoName() -> String {
        let uuidString = UUID().uuidString
        let number = Int.random(in: 0...1000)
        let unixTimestamp = Date().timeIntervalSince1970

        return uuidString + "_\(number)_" + "\(unixTimestamp)" + ".mov"
    }
    
}

