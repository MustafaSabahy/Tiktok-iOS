//
//  ExploreUserViewModel.swift
//  Tiktok
//
//  Created by mustafa sabahy on 05/07/2022.
//

import Foundation
import UIKit

struct ExploreUserViewModel {
    let profilePicture: UIImage?
    let username: String
    let followerCuunt: Int
    let handler: (() -> Void)
}
