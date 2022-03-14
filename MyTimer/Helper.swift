//
//  Helper.swift
//  MyTimer
//
//  Created by Ken Muyesu on 12/03/2022.
//

import Foundation

//Three (3) Timer states

enum TimerMode {
    case initial
    case running
    case paused
}

func secondsToMinutesAndSeconds (seconds: Int) -> String {
    let minutes = "\((seconds % 3600) / 60)"
    let seconds = "\((seconds % 3600) % 60)"
    let minuteStamp = minutes.count > 1 ? minutes : "0" + minutes
    let secondStamp = seconds.count > 1 ? seconds : "0" + seconds
    return "\(minuteStamp):\(secondStamp)"

}

