//
//  ExploreHashTagViewModel.swift
//  Tiktok
//
//  Created by mustafa sabahy on 05/07/2022.
//

import Foundation
import UIKit

struct ExploreHashtagViewModel {
    let text: String
    let icon: UIImage?
    let count: Int // number of posts associated with tag
    let handler: (() -> Void)
}
