//
//  MyTimerApp.swift
//  MyTimer
//
//  Created by Ken Muyesu on 12/03/2022.
//

import SwiftUI

@main
struct MyTimerApp: App {
    @ObservedObject var timerManager = TimerManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView(timerManager: timerManager)
        }
    }
}
