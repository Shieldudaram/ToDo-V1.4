import SwiftUI

struct PrioritySection: View {
    var label: String
    var color: Color
    var isSelected: Bool

    var body: some View {
        VStack {
            Text(label)
                .font(.headline)
                .foregroundColor(isSelected ? .black : .white)
                .padding()
            Spacer()
        }
        .background(isSelected ? color.opacity(0.3) : color)
        .cornerRadius(10)
        .padding(5)
    }
}

#Preview {
    PrioritySection(label: "Need & Now", color: .red, isSelected: false)
        .frame(width: 150, height: 150)
}