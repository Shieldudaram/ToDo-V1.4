//
//  TaskViewModel.swift
//  ToDo V1.4
//
//  Created by Chris Jennison on 8/20/24.
//

import SwiftUI
import Combine

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task]

    init(tasks: [Task] = []) {
        self.tasks = tasks
    }

    func addTask(name: String, points: Int) {
        let newTask = Task(name: name, points: points)
        tasks.append(newTask)
    }

    func toggleTaskCompletion(task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
        }
    }

    func calculateTotalScore() -> Int {
        return tasks.filter { $0.isCompleted }.map { $0.points }.reduce(0, +)
    }

    func getMedievalTitle() -> String {
        let score = calculateTotalScore()
        switch score {
        case 0...20: return "Peasant"
        case 21...40: return "Squire"
        case 41...60: return "Knight"
        case 61...80: return "Baron"
        case 81...99: return "Duke"
        default: return "Lord"
        }
    }
}
