//
//  ContentView.swift
//  TimerApp
//
//  Created by Michele Manniello on 13/03/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var timerManager = TimeManager()
    @State var selectedPikerIndex = 0
//    array
    let avaliableMinutes = Array(1...59)
    
    var body: some View {
        NavigationView {
            VStack {
                Text("\(secondToMinutesAndSeconds(secons: timerManager.secondsleft) )")
                    .font(.system(size: 80))
                    .padding(.top,80)
                Image(systemName: timerManager.timerMode == .running ? "pause.circle.fill" : "play.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 180)
                    .foregroundColor(.red)
                    .onTapGesture {
                        if self.timerManager.timerMode == .initial{
                            self.timerManager.setTimerLenght(minutes: self.avaliableMinutes[self.selectedPikerIndex]*60)
                        }
                        self.timerManager.timerMode == .running ?
                        self.timerManager.pause() :
                        self.timerManager.start()
                        
                    }
                if  timerManager.timerMode == .paused{
                    Image(systemName: "gobackward")
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .padding(.top,40)
                        .onTapGesture {
                            self.timerManager.reset()
                        }
                }
                if  timerManager.timerMode == .initial{
                    Picker(selection: $selectedPikerIndex, label: Text(""), content: {
                        
                        ForEach(0..<avaliableMinutes.count){
                            Text("\(self.avaliableMinutes[$0]) min")
                        }
                    })
                    .labelsHidden()
                }
                Spacer()
            }
            .navigationBarTitle("Timer")
        }
//        Camibia il colore del simulatore
        .environment(\.colorScheme, .dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
