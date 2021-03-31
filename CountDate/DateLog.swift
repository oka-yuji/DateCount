//
//  DateLog.swift
//  CountDate
//
//  Created by 岡優志 on 2021/03/31.
//

import SwiftUI

class DateLog: ObservableObject {
    
    @Published var endDate: Date {
        didSet {
            UserDefaults.standard.set(endDate, forKey: "endDate")
        }
    }
    
    init() {
        endDate = UserDefaults.standard.object(forKey: "endDate") as? Date ?? Date()
    }
}
 
