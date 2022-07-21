//
//  SwitchCellViewModel.swift
//  Tiktok
//
//  Created by mustafa sabahy on 20/07/2022.
//
import Foundation

struct SwitchCellViewModel {
    let title: String
    var isOn: Bool

    mutating func setOn(_ on: Bool) {
        self.isOn = on
    }
}
