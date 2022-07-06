//
//  ExplorePostViewModer.swift
//  Tiktok
//
//  Created by mustafa sabahy on 05/07/2022.
//

import Foundation
import UIKit

struct ExplorePostViewModel {
    let thumbnailImage: UIImage?
    let caption: String
    let handler: (() -> Void)
}
