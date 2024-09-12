import SwiftUI

struct PrioritySection: View {
    var label: String
    var color: Color

    var body: some View {
        VStack {
            Text(label)
                .font(.headline)
                .foregroundColor(.white)
                .padding()
            Spacer()
        }
        .background(color)
        .cornerRadius(10)
        .padding(5)
    }
}

#Preview {
    PrioritySection(label: "Need & Now", color: .red)
        .frame(width: 150, height: 150)
}