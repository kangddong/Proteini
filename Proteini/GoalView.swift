//
//  GoalView.swift
//  Proteini
//
//  Created by 강동영 on 4/30/24.
//

import SwiftUI

struct GoalView: View {
    @Binding var weight: String
    @Binding var rhs: String
    var body: some View {
        VStack {
            HStack {
                Text("몸무게")
                Spacer()
            }
            .padding()
            
            CustomTextField(
                text: $weight,
                placeholder: "몸무게를 입력해주세요.",
                textAlignment: .leading,
                showClearButton: true
            )
            
            HStack {
                Text("섭취량")
                Spacer()
            }
            .padding()
            
            CustomTextField(
                text: $rhs,
                placeholder: "1.0g",
                textAlignment: .leading,
                showClearButton: true
            )
        }
        
    }
}

#Preview {
    GoalView(
        weight: Binding<String>.constant("85kg"),
        rhs: Binding<String>.constant("1.0g")
    )
    
}
