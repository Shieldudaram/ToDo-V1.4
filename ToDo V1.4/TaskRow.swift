import SwiftUI

struct TaskRow: View {
    @Binding var task: Task
    var onDelete: () -> Void

    let columns = [
        GridItem(.adaptive(minimum: 40)) // Adjust the minimum value accordingly
    ]

    var body: some View {
        HStack {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(task.isCompleted.indices, id: \.self) { index in
                    Toggle("", isOn: $task.isCompleted[index])
                        .toggleStyle(CheckboxToggleStyle())
                        .frame(width: 40)
                }
            }
            .frame(maxWidth: 200) // Set a max width to prevent overflow

            Text(task.name)
                .foregroundColor(.white)
                .padding(.leading, 8)

            Spacer()

            Text("\(task.points) pts")
                .foregroundColor(.yellow)

            Button(action: onDelete) { 
                Image(systemName: "xmark.circle")
                    .foregroundColor(.red)
            }
            .buttonStyle(BorderlessButtonStyle())
        }
        .padding(.horizontal, 20)
        .background(Color.clear)
    }
}

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }) {
            Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                .foregroundColor(configuration.isOn ? .green : .white)
                .imageScale(.large)
        }
        .buttonStyle(PlainButtonStyle())
    }
}