//
//  ContentView.swift
//  Proteini
//
//  Created by 강동영 on 4/30/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            GoalView(
                weight: Binding<String>.constant("85kg"),
                rhs: Binding<String>.constant("1.0g")
                )
                .tabItem {
                    Label {
                        Text("Goal")
                    } icon: {
                        Image(systemName: "42.circle")
                    }
                }
            
            CalendarView()
                .tabItem {
                    Label {
                        Text("Calendar")
                    } icon: {
                        Image(systemName: "calendar")
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
