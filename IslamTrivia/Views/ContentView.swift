//
//  ContentView.swift
//  IslamTrivia
//
//  Created by Irchad TUAN-KITCHIL on 22/05/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 40) {
            VStack(spacing:20){
                Text("الله")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                
                Text("Are you ready to test yourself ?")
                    .foregroundColor(.white)
            }
            PrimaryButton(text: "Let's go !", background: Color(.white))
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
        .background(Color("AccentColor"))
    }
}

#Preview {
    ContentView()
}
