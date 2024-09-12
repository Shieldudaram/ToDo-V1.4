import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = TaskViewModel()

    @State private var showDailyList = false
    @State private var showBrainDump = false
    @State private var showPriorityWindow = false
    @State private var showTimeBlock = false
    @State private var showAddTaskSheet = false

    @State private var brainDumpWords: [String] = []

    @State private var sortedTerms: [String: [String]] = [:]

    private let backgroundColor = Color.blue

    var body: some View {
        ZStack {
            backgroundColor.edgesIgnoringSafeArea(.all)

            if showDailyList {
                dailyListView
            } else if showBrainDump {
                BrainDumpView(brainDumpWords: $brainDumpWords, onMainScreen: resetView)
            } else if showPriorityWindow {
                PriorityWindowView(brainDumpWords: brainDumpWords, onMainScreen: resetView, sortedTerms: $sortedTerms)
            } else if showTimeBlock {
                timeBlockView
            } else {
                mainScreen
            }
        }
        .sheet(isPresented: $showAddTaskSheet) {
            AddTaskView(viewModel: viewModel)
        }
    }

    var mainScreen: some View {
        VStack {
            Text("Points: \(viewModel.calculateTotalScore())")
                .font(.largeTitle)
                .foregroundColor(.white)
            Text(viewModel.getMedievalTitle())
                .font(.title)
                .foregroundColor(.white)
                .padding(.top, 10)

            Spacer()

            VStack(spacing: 20) {
                Button(action: {
                    showDailyList = true
                }) {
                    Text("Daily List")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
                Button(action: {
                    showBrainDump = true
                }) {
                    Text("Brain Dump")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
                Button(action: {
                    showPriorityWindow = true
                }) {
                    Text("Priority Window")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
                Button(action: {
                    showTimeBlock = true
                }) {
                    Text("Time Block")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal, 30)
            .padding(.bottom, 50)
        }
    }

    var dailyListView: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    showAddTaskSheet = true
                }) {
                    Text("Add Task")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding([.leading, .trailing, .top], 16)
                Spacer()
            }

            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach($viewModel.tasks) { $task in
                        TaskRow(task: $task) {
                            viewModel.deleteTask(task: task)
                        }
                    }
                }
                .padding(.top, 20)
            }

            Spacer()

            Button(action: resetView) {
                Text("Main Screen")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white)
                    .foregroundColor(.black)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 30)
            .padding(.bottom, 50)
        }
        .background(backgroundColor.edgesIgnoringSafeArea(.all))
    }

    var timeBlockView: some View {
        VStack {
            ScrollView {
                HStack {
                    VStack(alignment: .leading) {
                        ForEach(0..<24) { hour in
                            Text("\(hour % 12 == 0 ? 12 : hour % 12) \(hour < 12 ? "am" : "pm")")
                                .padding(.vertical, 8)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    .frame(maxWidth: 100)
                    .padding()

                    VStack(alignment: .leading) {
                        ForEach(["Need & Now", "Need & Later", "Want & Now", "Want & Later"], id: \.self) { section in
                            if let terms = sortedTerms[section], !terms.isEmpty {
                                ForEach(terms, id: \.self) { term in
                                    Text(term)
                                        .padding(8)
                                        .background(getColor(for: section))
                                        .cornerRadius(8)
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 10)
                                }
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }

            Spacer()

            Button(action: resetView) {
                Text("Main Screen")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white)
                    .foregroundColor(.black)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 30)
            .padding(.bottom, 50)
        }
        .background(backgroundColor.edgesIgnoringSafeArea(.all))
    }

    private func getColor(for section: String) -> Color {
        switch section {
        case "Need & Now": return .red
        case "Need & Later": return .orange
        case "Want & Now": return .green
        case "Want & Later": return .yellow
        default: return .gray
        }
    }

    private func resetView() {
        showDailyList = false
        showBrainDump = false
        showPriorityWindow = false
        showTimeBlock = false
    }
}

#Preview {
    ContentView()
}