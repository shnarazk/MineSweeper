//
//  Item.swift
//  MineSweeper
//
//  Created by 楢崎修二 on 2023/12/10.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
