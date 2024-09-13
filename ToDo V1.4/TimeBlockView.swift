import SwiftUI

struct TimeBlockView: View {
    @Binding var sortedTerms: [String: [String]]
    private let times: [String] = (0..<24).map { "\($0 % 12 == 0 ? 12 : $0 % 12) \($0 < 12 ? "am" : "pm")" }
    @State private var selectedTime: String?
    @State private var termsAtTime: [String: [String: [String]]] = [:] // [time : [section: [terms]]]
    var onMainScreen: () -> Void

    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    ForEach(times, id: \.self) { time in
                        HStack {
                            Text(time)
                                .padding(.vertical, 8)
                                .background(selectedTime == time ? Color.gray : Color.clear)
                                .onTapGesture {
                                    selectedTime = time
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)

                            VStack(alignment: .leading) {
                                if let timeTerms = termsAtTime[time] {
                                    ForEach(timeTerms.keys.sorted(), id: \.self) { section in
                                        ForEach(timeTerms[section]!, id: \.self) { term in
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
                }
            }

            Spacer()

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

    private func getColor(for section: String) -> Color {
        switch section {
        case "Need & Now": return .red
        case "Need & Later": return .orange
        case "Want & Now": return .green
        case "Want & Later": return .yellow
        default: return .gray
        }
    }
}

#Preview {
    TimeBlockView(sortedTerms: .constant(["Need & Now": ["Example"]]), onMainScreen: {})
}