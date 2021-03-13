//
//  Helper.swift
//  TimerApp
//
//  Created by Michele Manniello on 13/03/21.
//

import Foundation

enum TimerMode{
    case running
    case paused
    case initial
}
func secondToMinutesAndSeconds(secons : Int) -> String {
    let minute = "\((secons % 3600) / 60)"
    let seconds = "\((secons % 3600) % 60)"
    let minuteStamp = minute.count > 1 ? minute : "0" + minute
    let secondsStamp = seconds.count > 1 ? seconds : "0" + seconds
    
    return "\(minuteStamp) : \(secondsStamp)"
    
}
