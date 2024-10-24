import SwiftUI

struct SwiftUIViewtry: View {
    let streets = ["zzz", "tortul.fill", "hare"]
    @State private var waterIntake: Double = 0.0
    @State private var totalWaterIntake: Double = 2.7

    var body: some View {
        VStack(spacing: 10) {
            Text("Today's Water Intake")
                .foregroundColor(Color.black.opacity(0.6))
                .padding(.trailing, 190)
            HStack{
                Text("\(waterIntake, specifier: "%.1f") liter")
                    .bold()
                    .font(.title2)
                    .foregroundColor(waterIntake >= totalWaterIntake ? Color.green : Color.black)
                
                Text(" / \(totalWaterIntake, specifier: "%.1f") liter")
                    .bold()
                    .font(.title2)
                .foregroundColor(Color.black)}.padding(.trailing,180)
            
            ZStack {
                Circle()
                    .stroke(Color.gray.opacity(0.1), lineWidth: 28)
                    .frame(width: 313, height: 313)
                
                Circle()
                    .trim(from: 0, to: waterIntake / totalWaterIntake)
                    .stroke(style: StrokeStyle(lineWidth: 28, lineCap: .round))
                    .fill(.cyan)
                    .frame(width: 313, height: 313)
                    .rotationEffect(.degrees(-90))
                
//                 C/*hange image based on water intake*/
                Image(systemName: imageForWaterIntake(waterIntake))
                    .resizable()
                    .foregroundColor(Color.yellow)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 110, height: 100)
            }
            .padding(.top, 120)

            Spacer()
            VStack {
                Text("\(waterIntake, specifier: "%.1f") L")
                    .font(.title)
                    .bold()
                   .foregroundColor(.black)

                Stepper("", value: $waterIntake, in: 0...totalWaterIntake, step: 0.1).labelsHidden()
            }
        }
        .padding()
    }
    
    // Function to determine the image based on water intake
    private func imageForWaterIntake(_ intake: Double) -> String {
        switch intake {
        case 0..<0.7:
            return "zzz" // Image for low intake
        case 0.7..<1.4:
            return "tortoise.fill" // Image for moderate intake
        case 1.4..<2.1:
            return "hare.fill"
        default:
            return "hands.and.sparkles.fill" // Image for high intake
        }
    }
}

struct WaterIntakeTracker_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIViewtry()
    }
}
