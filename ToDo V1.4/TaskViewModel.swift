import SwiftUI
import Combine

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    @Published var sortedTerms: [String: [String]] = [:]

    init() {
        loadTasks()
        loadSortedTerms()
    }

    func addTask(name: String, points: Int, checkboxes: Int) {
        let newTask = Task(name: name, points: points, isCompleted: Array(repeating: false, count: checkboxes))
        tasks.append(newTask)
        saveTasks()
    }

    func toggleTaskCompletion(task: Task, atIndex index: Int) {
        if let taskIndex = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[taskIndex].isCompleted[index].toggle()
        }
        objectWillChange.send() // Ensure the view updates immediately
        saveTasks()
    }

    func deleteTask(task: Task) {
        tasks.removeAll { $0.id == task.id }
        saveTasks()
    }

    func calculateTotalScore() -> Int {
        return tasks.map { task in
            task.isCompleted.filter { $0 }.count * task.points
        }.reduce(0, +)
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

    // Persistence methods
    private func saveTasks() {
        do {
            let data = try JSONEncoder().encode(tasks)
            UserDefaults.standard.set(data, forKey: "tasks")
        } catch {
            print("Failed to save tasks: \(error)")
        }
    }

    private func saveSortedTerms() {
        do {
            let data = try JSONEncoder().encode(sortedTerms)
            UserDefaults.standard.set(data, forKey: "sortedTerms")
        } catch {
            print("Failed to save sorted terms: \(error)")
        }
    }

    func loadTasks() {
        if let data = UserDefaults.standard.data(forKey: "tasks") {
            do {
                tasks = try JSONDecoder().decode([Task].self, from: data)
            } catch {
                print("Failed to load tasks: \(error)")
            }
        }
    }

    func loadSortedTerms() {
        if let data = UserDefaults.standard.data(forKey: "sortedTerms") {
            do {
                sortedTerms = try JSONDecoder().decode([String: [String]].self, from: data)
            } catch {
                print("Failed to load sorted terms: \(error)")
            }
        }
    }

    func saveCurrentState() {
        saveTasks()
        saveSortedTerms()
    }
}