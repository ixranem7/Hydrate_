//
//  screen1.swift
//  Hydrate_
//
//  Created by Raneem on 19/04/1446 AH.
//

import SwiftUI

struct screen1: View {
    @State private var inputText: String = ""
    @State private var waterIntake: CGFloat = 0.0
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            
            Image(systemName: "drop.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(.cyan).frame(width: 50,height: 50)
            
            Text("Hydrate")
                .font(.title)
                .fontWeight(.bold)
                .bold()
            Text("Start with Hydrate to record and track your water intake daily based on your needs and stay      hydrated ")
                .foregroundColor(Color.gray)
            
            HStack {
                Rectangle()
                    .frame(width: 355, height: 44 , alignment: .leading)
                    .foregroundColor(Color.gray.opacity(0.1))
                    .overlay(
                        HStack(spacing: 8) {
                            Text("Body weight")
                                .foregroundColor(.black)
                            
                            
                            TextField("value", text: $inputText)
                                .keyboardType(.decimalPad)
                                .foregroundColor(.black)
                                .padding(.leading)
                            //, inputText.isEmpty ? 0 : 36)
                            
                            if !inputText.isEmpty {
                                Button(action: {
                                    inputText = ""
                                }) {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.gray)
                                }
                                // .padding(.trailing)
                            }
                            
                        }.padding()
                    )
                
                
                
            }
            
           
            
        }
        .padding(.bottom,10)
        
                ZStack{ Rectangle()
                        .frame(width: 355,height: 44)
                        .foregroundColor(Color.light)
                        .cornerRadius(10)
                    Text("Next")
                        .foregroundColor(Color.white)
        
                }.padding(.top,300)
    }}
    

#Preview {
    screen1()
}
