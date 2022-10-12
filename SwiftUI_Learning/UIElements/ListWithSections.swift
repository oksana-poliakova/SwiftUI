//
//  ListWithSections.swift
//  SwiftUI_Learning
//
//  Created by Oksana on 10.10.2022.
//

import SwiftUI

struct TaskRaw: View {
    var body: some View {
        Text("Some task")
    }
}

// MARK: - List with sections

struct ListWithSections: View {
    var body: some View {
        List {
            Section(header: Text("Important Tasks"),
                    footer: Text("End of the List")) {
                TaskRaw()
                TaskRaw()
                TaskRaw()
                TaskRaw()
            } .listRowBackground(Color.blue)
            
            Section(header: Text("Other Tasks")) {
                TaskRaw()
                TaskRaw()
                TaskRaw()
            } .listRowBackground(Color.green)
            
        } .listStyle(.grouped)
    }
}

struct ListWithSections_Previews: PreviewProvider {
    static var previews: some View {
        ListWithSections()
    }
}
