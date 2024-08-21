//
//  Task.swift
//  ToDo V1.4
//
//  Created by Chris Jennison on 8/20/24.
//

import Foundation

class Task: Identifiable, ObservableObject, Codable {
    var id: UUID
    var name: String
    var points: Int
    @Published var isCompleted: [Bool]

    init(id: UUID = UUID(), name: String, points: Int, isCompleted: [Bool]) {
        self.id = id
        self.name = name
        self.points = points
        self.isCompleted = isCompleted
    }

    // Codable conformance
    enum CodingKeys: String, CodingKey {
        case id, name, points, isCompleted
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        points = try container.decode(Int.self, forKey: .points)
        isCompleted = try container.decode([Bool].self, forKey: .isCompleted)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(points, forKey: .points)
        try container.encode(isCompleted, forKey: .isCompleted)
    }
}
