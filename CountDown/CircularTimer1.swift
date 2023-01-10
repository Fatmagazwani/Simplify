//
//  CircularTimer.swift
//  CountDown
//
//  Created by Fatma Gazwani on 17/06/1444 AH.
//

import SwiftUI
 
let timer = Timer
    .publish(every: 1, on: .main, in: .common)
    .autoconnect()

struct CircularTimer: View {
    // MARK: Changed type to TIMEINTERVAL
    @State var counter: TimeInterval = 0
    
    // MARK: New DATE variables using DATECOMPONENTS
    @State var startDate: Date = Calendar.current.date(from: DateComponents(year: 2022, month: 2, day: 4, hour: 11, minute: 00, second: 10)) ?? Date.now
    var endDate: Date = Calendar.current.date(from: DateComponents(year: 2022, month: 2, day: 4, hour: 11, minute: 00, second: 00)) ?? Date.now
    
    // MARK: Calculated TIMEINTERVAL instead of original COUNTTO variable
    var timeInterval: TimeInterval {
        let end = endDate
        let start = startDate
        
        return start.timeIntervalSince(end)
    }
    
    var body: some View {
        NavigationView {
            VStack{
                ZStack{
                    Circle()
                        .fill(Color.clear)
                        .frame(width: 250, height: 250)
                        .overlay(
                            Circle().stroke(Color.green, lineWidth: 25)
                    )
                     
                    Circle()
                        .fill(Color.clear)
                        .frame(width: 250, height: 250)
                        .overlay(
                            Circle().trim(from:0, to: progress())
                                .stroke(
                                    style: StrokeStyle(
                                        lineWidth: 25,
                                        lineCap: .round,
                                        lineJoin:.round
                                    )
                                )
                                .foregroundColor(
                                    (completed() ? Color.orange : Color.red)
                                ).animation(.easeInOut(duration: 0.2))
                        )
                    // MARK: Text view for DATE just to show you that timer is working
                    Text("\(startDate.formatted(date: .long, time: .standard))")
                        .font(.system(size: 10))
                        .foregroundColor((timeInterval == 0) ? .orange : .black)
                }
            }
            // MARK: Changed logic for timer calculations
            .onReceive(timer) { time in
                if (timeInterval != 0) {
                    counter += 1
                    startDate -= 1
                }
            }
            
            // MARK: A few changes to the layout
            .navigationTitle("Timer")
            .toolbar {
                Button("Start again", action: startAgain)
            }
        }
    }
    
    // MARK: Function for a START AGAIN button
    func startAgain() {
        counter = 0
        startDate = Calendar.current.date(from: DateComponents(year: 2022, month: 2, day: 4, hour: 11, minute: 00, second: 10)) ?? Date.now
        return
    }
    
    func completed() -> Bool {
        return progress() == 1
    }
     
    func progress() -> CGFloat {
        return (CGFloat(counter) / CGFloat(timeInterval + counter))
    }
}
