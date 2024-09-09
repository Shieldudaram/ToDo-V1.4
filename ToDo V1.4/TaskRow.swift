import SwiftUI

struct TaskRow: View {
    @Binding var task: Task
    var onDelete: () -> Void

    var body: some View {
        HStack {
            Toggle("", isOn: $task.isCompleted[0])
                .toggleStyle(CheckboxToggleStyle())
                .frame(width: 40)

            Text(task.name)
                .foregroundColor(.white)

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