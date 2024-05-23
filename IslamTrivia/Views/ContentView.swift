//
//  ContentView.swift
//  IslamTrivia
//
//  Created by Irchad TUAN-KITCHIL on 22/05/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                VStack(spacing:20){
                    Text("الله")
                        .lightBrownTitle()
                    
                    Text("Connais-tu tous les noms d'Allah ?")
                        .lightBrownParagraph()
                }
                NavigationLink{
                    TriviaView()
                } label: {
                    PrimaryButton(text: "Let's go !", background: Color("TextColor"))
                }
            }
            .lightYellowView()
        }
    }
}

#Preview {
    ContentView()
}
