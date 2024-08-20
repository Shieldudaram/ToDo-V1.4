//
//  Task.swift
//  ToDo V1.4
//
//  Created by Chris Jennison on 8/20/24.
//

import Foundation
import SwiftData

@Model
class Task: Identifiable, ObservableObject {
    var id: UUID = UUID()
    var name: String
    var points: Int
    var isCompleted: [Bool]

    init(name: String, points: Int, isCompleted: [Bool]) {
        self.name = name
        self.points = points
        self.isCompleted = isCompleted
    }
}
