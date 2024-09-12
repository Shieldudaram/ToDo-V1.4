import SwiftUI

struct PriorityWindowView: View {
    var brainDumpWords: [String]
    var onMainScreen: () -> Void

    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    ForEach(brainDumpWords, id: \.self) { word in
                        Text(word)
                            .padding(8)
                            .background(Color.white.opacity(0.8))
                            .cornerRadius(8)
                            .foregroundColor(.black)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            }

            Spacer()

            HStack(spacing: 10) {
                VStack(spacing: 10) {
                    HStack(spacing: 10) {
                        PrioritySection(label: "Need & Now", color: Color.red)
                        PrioritySection(label: "Need & Later", color: Color.blue)
                    }
                    HStack(spacing: 10) {
                        PrioritySection(label: "Want & Now", color: Color.green)
                        PrioritySection(label: "Want & Later", color: Color.yellow)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 200)
            }
            .padding()

            Button(action: onMainScreen) {
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
        .background(Color.blue.edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    PriorityWindowView(brainDumpWords: ["Example"], onMainScreen: {})
}