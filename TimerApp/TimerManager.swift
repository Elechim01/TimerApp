//
//  TimerManager.swift
//  TimerApp
//
//  Created by Michele Manniello on 13/03/21.
//

import Foundation
import SwiftUI
import AVFoundation
class TimeManager: ObservableObject {
    
    @Published var timerMode : TimerMode = .initial
    @Published var secondsleft = UserDefaults.standard.integer(forKey: "timerLength")
    var timer = Timer()
    let systemSoundID : SystemSoundID = 1107
    
    func setTimerLenght(minutes: Int){
        let defaults = UserDefaults.standard
        defaults.set(minutes,forKey: "timerLength")
        secondsleft = minutes
    }
    
    func start(){
        timerMode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
            if self.secondsleft == 0 {
                AudioServicesPlaySystemSound(self.systemSoundID)
                self.reset()
            }
            self.secondsleft -= 1
        
        })
    }
    func reset(){
        self.timerMode = .initial
        self.secondsleft = UserDefaults.standard.integer(forKey: "timerLength")
        timer.invalidate()
    }
    func pause(){
        self.timerMode = .paused
        timer.invalidate()
    }
    
}
