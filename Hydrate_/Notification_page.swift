import SwiftUI

struct NotificationPage: View {
    @State private var selectData1 = Date()
    @State private var selectData2 = Date()
    @State private var selectedPeriod1 = "AM"
    @State private var selectedPeriod2 = "AM"// Correct initialization with Date()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Notification Preference")
                .font(.title2)
                .bold()
                .padding(.vertical) // Adds vertical padding around the text
            
            Text("The start and end hour")
                .padding(.vertical, 8) // Adds bottom padding
            
            Text("Specify the start and end date to receive the notifications")
                .foregroundColor(Color.gray)
        }
        .padding(.bottom, 50) // Adds padding around the entire VStack
        
        
        //
        ZStack{
            
            Rectangle()
                .frame(width: 355, height: 108)
                .foregroundColor(Color.gray.opacity(0.2))
            //
            //            Text("start").frame(width: .infinity).padding(.trailing,120)
            HStack(alignment:.center , spacing: 30){
                Text("Start hour").font(.title3)
                DatePicker("Start", selection: $selectData1, displayedComponents: .hourAndMinute)
                //.labelsHidden() // Hide labels if necessary
                // Add padding inside the rectangle
                    .labelsHidden()
                
                Picker("", selection: $selectedPeriod1) {
                    Text("AM").tag("AM")
                    Text("PM").tag("PM")
                    
                }
                .pickerStyle(SegmentedPickerStyle())
                .font(.title)
                .frame(width: 100)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray.opacity(0.2))
                    
                )
            }.padding(20)
                .padding(.bottom,50)
            //  .padding(.leading,0)
            HStack(alignment:.center , spacing: 30){
                Text("End hour").font(.title3)
                DatePicker("End", selection: $selectData2, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                
                Picker("", selection: $selectedPeriod2) {
                    Text("AM").tag("AM")
                    Text("PM").tag("PM")
                    
                }
                .pickerStyle(SegmentedPickerStyle())
                .font(.title)
                .frame(width: 100,height: 34)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray.opacity(0.2))
                    
                )
            }.padding(20)
                .padding(.top,50)
            //.padding(.leading,110)
        }
        VStack(alignment: .leading) {
            // Adds vertical padding around the text
            
            Text("Notification interval")
                .padding(.vertical, 8) // Adds bottom padding
            
            Text("How often would you like to receive notifications within the specified time interval")
                .foregroundColor(Color.gray)
        }
        VStack(spacing: 15) {
            HStack(spacing: 15) {
                TimeCard(time: "15", unit: "Mins") { /* Add action here */ }
                TimeCard(time: "30", unit: "Mins") { /* Add action here */ }
                TimeCard(time: "60", unit: "Mins") { /* Add action here */ }
                TimeCard(time: "90", unit: "Mins") { /* Add action here */ }
            }
            
            HStack(spacing: 15) {
                TimeCard(time: "2", unit: "Hours") { /* Add action here */ }
                TimeCard(time: "3", unit: "Hours") { /* Add action here */ }
                TimeCard(time: "4", unit: "Hours") { /* Add action here */ }
                TimeCard(time: "5", unit: "Hours") { /* Add action here */ }
            }
        }
        .padding()
        ZStack{ Rectangle()
                .frame(width: 355,height: 44)
                .foregroundColor(Color.light)
                .cornerRadius(10)
            Text("Next")
                .foregroundColor(Color.white)
            
        }
        
    }
    struct TimeCard1: View {
        let time: String
        let unit: String
        let action: () -> Void
        
        var body: some View {
            Button(action: action) {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.red)
                        .frame(width: 77, height: 70)
                        
                    
                    VStack(spacing: 4) {
                        Text(time)
                            .foregroundColor(Color.cyan)
                        Text(unit)
                        .foregroundColor(Color.black)}//close vstack
                }//close zstack
            }
        }
    }}

#Preview {
    NotificationPage()
}
