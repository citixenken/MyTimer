//
//  ContentView.swift
//  MyTimer
//
//  Created by Ken Muyesu on 12/03/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var timerMode: TimerMode = .paused
    @State private var selectedPicker = 0
    let availableMinutes = Array(1...59)
    
    var body: some View {
        NavigationView {
            VStack {
                Text("60")
                    .font(.system(size: 80))
                    .padding(.top, 80)
                
                Image(systemName: timerMode == .running ? "play.circle.fill" : "pause.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .foregroundColor(.orange)
                
                if timerMode == .paused {
                    Image(systemName: "gobackward")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .padding(.top, 40)
                    
                }
                
                if timerMode == .initial {
                    Picker(selection: $selectedPicker, label: Text(""), content: {
                        ForEach(0..<availableMinutes.count) {
                            Text("\(availableMinutes[$0]) min")
                        }
                    } )
                        .pickerStyle(.wheel)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
