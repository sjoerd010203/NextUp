//
//  Item.swift
//  NextUp
//
//  Created by Sjoerd van Lexmond on 08/06/2025.
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
