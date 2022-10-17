//
//  DatePickerTest.swift
//  SwiftUI_Learning
//
//  Created by Oksana on 17.10.2022.
//

import SwiftUI

struct DatePickerTest: View {
    
    @State private var selectedDate: Date = Date()
    
    let startingDate: Date = Calendar.current.date(from: DateComponents(year: 2015)) ?? Date()
    let endingDate: Date = Date()
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .short
        return formatter
    }()
    
    var body: some View {
        VStack {
            Text("Selected data is:")
            Text(dateFormatter.string(from: selectedDate))
                .font(.title)
            
            // First date picker
            DatePicker("Select a date", selection: $selectedDate, displayedComponents: [.date, .hourAndMinute])
                .accentColor(.blue)
                .datePickerStyle(.compact)
                .padding()
            
            // Second date picker with a date from year 2015
            DatePicker("Select a date from 2015", selection: $selectedDate, in: startingDate...endingDate, displayedComponents: [.date])
                .datePickerStyle(.compact)
                .padding()
        }
    }
}

struct DatePickerTest_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerTest()
    }
}
