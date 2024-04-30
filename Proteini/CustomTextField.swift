//
//  CustomTextField.swift
//  Proteini
//
//  Created by 강동영 on 4/30/24.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    @FocusState var focusState: Bool
    let placeholder: String
    let textAlignment: TextAlignment
    let backgroundColor: Color
    let font: Font
    let showClearButton: Bool
    let keyboardType: UIKeyboardType
    
    var focusTintColor: Color {
        return focusState ? DesignSystem.Colors.black : DesignSystem.Colors.lightGray
    }
    
    public init(
        text: Binding<String>,
        placeholder: String,
        font: Font = .system(size: 17),
        textAlignment: TextAlignment = .leading,
        backgroundColor: Color = DesignSystem.Colors.lightGray,
        showClearButton: Bool = false,
        keyboardType: UIKeyboardType = .default,
        focusState: FocusState<Bool> = .init()
    ) {
        self._text = text
        self.placeholder = placeholder
        self.textAlignment = textAlignment
        self.backgroundColor = backgroundColor
        self.font = font
        self.showClearButton = showClearButton
        self.keyboardType = keyboardType
        self._focusState = focusState
    }
    
    var body: some View {
        HStack(spacing: 5) {
            TextField(placeholder, text: $text)
                .font(font)
                .focused($focusState)
                .frame(height: 48)
                .multilineTextAlignment(textAlignment)
                .foregroundStyle(DesignSystem.Colors.label)
                .padding(.vertical, 7)
                .keyboardType(keyboardType)
                .autocorrectionDisabled()
            
            if showClearButton {
                Button(action: {
                    text = ""
                }, label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(focusTintColor)
                })
            }
        }
        .padding(.horizontal, 16)
        .background(backgroundColor)
        .clipShape(
            RoundedRectangle(cornerRadius: 10)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .inset(by: 1)
                .stroke(focusTintColor,
                        lineWidth: 1
                       )
                .foregroundColor(.clear)
        )
    }
}
