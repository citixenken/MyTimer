//
//  TimerManager.swift
//  MyTimer
//
//  Created by Ken Muyesu on 12/03/2022.
//

import SwiftUI

class TimerManager: ObservableObject {
    @Published var timerMode: TimerMode = .initial
    @Published var secondsLeft = 60
    
    var timer = Timer()
    
    func start() {
        timerMode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
            if self.secondsLeft == 0 {
                //                self.timerMode = .initial
                //                self.secondsLeft = 60
                //                timer.invalidate()
                self.reset()
            } else {
                self.secondsLeft -= 1
            }
        })
    }
    
    func reset() {
        self.timerMode = .initial
        self.secondsLeft = 60
        timer.invalidate()
    }
    
    func pause() {
        self.timerMode = .paused
        timer.invalidate()
    }
}
