import SwiftUI

struct TimesPage: View {
    var body: some View {
        VStack(spacing: 40) {
            HStack(spacing: 20) {
                TimeCard(time: "15", unit: "Mins") { /* Add action here */ }
                TimeCard(time: "30", unit: "Mins") { /* Add action here */ }
                TimeCard(time: "60", unit: "Mins") { /* Add action here */ }
                TimeCard(time: "90", unit: "Mins") { /* Add action here */ }
            }

            HStack(spacing: 20) {
                TimeCard(time: "2", unit: "Hours") { /* Add action here */ }
                TimeCard(time: "3", unit: "Hours") { /* Add action here */ }
                TimeCard(time: "4", unit: "Hours") { /* Add action here */ }
                TimeCard(time: "5", unit: "Hours") { /* Add action here */ }
            }
        }
        .padding()
    }
}

struct TimeCard: View {
    let time: String
    let unit: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    //.foregroundColor(Color(red: 0.9, green: 0.9, blue: 0.9))
                    .frame(width: 77, height: 70)

                VStack(spacing: 4) {
                    Text(time)
                        .foregroundColor(Color.cyan)
                    Text(unit)
                    .foregroundColor(Color.black)}//close vstack
            }//close zstack
        }
    }
}

struct TimesPage_Previews: PreviewProvider {
    static var previews: some View {
        TimesPage()
    }
}
