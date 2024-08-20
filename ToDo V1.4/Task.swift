//
//  Task.swift
//  ToDo V1.4
//
//  Created by Chris Jennison on 8/20/24.
//

import Foundation
import SwiftData

@Model
class Task {
    var id: UUID = UUID()
    var name: String
    var isCompleted: Bool = false
    var points: Int = 0

    init(name: String, points: Int) {
        self.name = name
        self.points = points
    }
}
