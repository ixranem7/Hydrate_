
import SwiftUI

struct ContentView: View {
    @State private var currentIntake: Double = 0.5
    let targetIntake: Double = 2.7

    var body: some View {
        VStack(spacing: 32) {
            ProgressCircleView(currentIntake: $currentIntake, targetIntake: targetIntake)

            Spacer()

            HStack(spacing: 24) {
             //   Stepper("h",)
                Button(action: { updateIntake(by: -0.1) }) {
                    Image(systemName: "minus")
                        .font(.title)
                }

                Text("\(currentIntake, specifier: "%.1f") L / \(targetIntake) L")
                    .font(.title)
                    .fontWeight(.bold)

                Button(action: { updateIntake(by: 0.1) }) {
                    Image(systemName: "plus")
                        .font(.title)
                }
            }
        }
        .padding()
    }

    private func updateIntake(by increment: Double) {
        currentIntake = max(0, min(targetIntake, currentIntake + increment))
    }
}

struct ProgressCircleView: View {
    @Binding var currentIntake: Double
    let targetIntake: Double

    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray.opacity(0.2), lineWidth: 20)
                .frame(width: 200, height: 200)

            Circle()
                .trim(from: 0, to: currentIntake / targetIntake)
                .stroke(Color.blue.opacity(0.7), lineWidth: 20)
                .frame(width: 200, height: 200)
                .rotationEffect(.degrees(-90))
               

            Image("turtle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
        }
    }
}

struct WaterIntakeTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
