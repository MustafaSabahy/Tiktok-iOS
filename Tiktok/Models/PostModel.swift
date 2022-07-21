//
//  File.swift
//  Tiktok
//
//  Created by mustafa sabahy on 02/07/2022.
//


import Foundation

struct PostModel {
    let identifier: String
    let user: User
    var fileName: String = ""
    var caption: String = ""

    var isLikedByCurrentUser = false

    static func mockModels() -> [PostModel] {
        var posts = [PostModel]()
        for _ in 0...100 {
            let post = PostModel(
                identifier: UUID().uuidString,
                user: User(
                    username: "kanyewest",
                    profilePictureURL: nil,
                    identifier: UUID().uuidString
                )
            )
            posts.append(post)
        }
        return posts
    }

    /// Represents database child path for this post in a given user node
    var videoChildPath: String {
        return "videos/\(user.username.lowercased())/\(fileName)"
    }
}
