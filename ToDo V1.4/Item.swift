//
//  Item.swift
//  ToDo V1.4
//
//  Created by Chris Jennison on 8/19/24.
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
