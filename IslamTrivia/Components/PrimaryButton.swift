//
//  PrimaryButton.swift
//  IslamTrivia
//
//  Created by Irchad TUAN-KITCHIL on 22/05/2024.
//

import SwiftUI

struct PrimaryButton: View {
    var text: String
    var background: Color = Color(.white)
    
    var body: some View {
        Text(text)
            .foregroundColor(Color("AccentColor"))
            .padding()
            .padding(.horizontal)
            .background(background)
            .cornerRadius(30)
            .shadow(radius: 10)
    }
}

#Preview {
    PrimaryButton(text: "Start")
}
