//
//  postComment.swift
//  Tiktok
//
//  Created by mustafa sabahy on 04/07/2022.
//

import Foundation
struct PostComment {
    let text: String
    let user: User
    let date: Date
    
    
    static func mockComments()->[PostComment]{
        
        
        let user = User(username: "sabahy", profilePictureURL: nil, identifier: UUID().uuidString)
        var comments = [PostComment]()
        
        let text = ["Wowww this is so awesome","fuck youuuu","great jobbbb"]
        
        for comment in text {
            comments.append(PostComment(text: comment, user: user, date: Date()))
            
        }
        
        return comments
        
    }
}
