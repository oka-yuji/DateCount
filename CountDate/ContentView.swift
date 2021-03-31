//
//  ContentView.swift
//  CountDate
//
//  Created by 岡優志 on 2021/03/31.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var dateLog: DateLog
    //残り日数の処理
    var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        return dateFormatter
    }
    var body: some View {
        ZStack{
            let firstDateReset = resetTime(date: dateLog.endDate)
            let secondDateReset: Date = resetTime(date: Date())
            Text("試験日まで残り\(Int(firstDateReset.timeIntervalSince(secondDateReset)/86400))日")
            
        DatePicker("試験日⇨",
                   selection: $dateLog.endDate,
                   in: Date()...,
                   displayedComponents: [.date])
            .foregroundColor(.clear)
            .opacity(0.1)
            .background(Color.clear)
            .opacity(0.1)
            .font(.title3)
        }.frame(width: 250, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(DateLog())
    }
}


//残り日数計算function
func resetTime(date: Date) -> Date {
    let calendar: Calendar = Calendar(identifier: .gregorian)
    var components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
    
    components.hour = 0
    components.minute = 0
    components.second = 0
    
    return calendar.date(from: components)!
}
