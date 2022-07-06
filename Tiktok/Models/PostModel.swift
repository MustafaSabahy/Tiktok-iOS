//
//  File.swift
//  Tiktok
//
//  Created by mustafa sabahy on 02/07/2022.
//

import Foundation

struct PostModel{
    
    let identifier : String
    
    let user = User(username: "sabahy", profilePictureURL: nil, identifier: UUID().uuidString)
    
    
    
         var isLikedByCurrentUser = false
    static func mockModels() -> [PostModel]{
      
        var posts = [PostModel]()
        for _ in 0...2{
            let post = PostModel(identifier: UUID().uuidString)
            posts.append(post)
        }
        return posts
    }
    
}
