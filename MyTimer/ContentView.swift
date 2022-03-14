//
//  ContentView.swift
//  MyTimer
//
//  Created by Ken Muyesu on 12/03/2022.
//

import SwiftUI

struct ContentView: View {
    //@State private var timerMode: TimerMode = .paused
    @State private var selectedPicker = 0
    let availableMinutes = Array(1...59)
    
    @ObservedObject var timerManager: TimerManager
    
    var body: some View {
        NavigationView {
            VStack {
//                Text("\(timerManager.secondsLeft)")
                Text(secondsToMinutesAndSeconds(seconds: timerManager.secondsLeft))
                    .font(.system(size: 80))
                    .padding(.top, 80)
                
                Image(systemName: timerManager.timerMode == .running ? "pause.circle.fill" : "play.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .foregroundColor(.orange)
                    .onTapGesture(perform: {
                        if timerManager.timerMode == .initial {
                            timerManager.setTimerLength(minutes: availableMinutes[selectedPicker]*60)
                        }
                        timerManager.timerMode == .running ? timerManager.pause() : timerManager.start()
                    })
                
                if timerManager.timerMode == .paused {
                    Image(systemName: "gobackward")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .padding(.top, 40)
                        .onTapGesture(perform: {
                            timerManager.reset()
                        })
                    
                }
                
                if timerManager.timerMode == .initial {
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
        ContentView(timerManager: TimerManager())
    }
}
