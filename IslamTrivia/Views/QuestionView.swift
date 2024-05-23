//
//  QuestionView.swift
//  IslamTrivia
//
//  Created by Irchad TUAN-KITCHIL on 23/05/2024.
//

import SwiftUI

struct QuestionView: View {
    var body: some View {
        VStack(spacing:40){
            HStack{
                Text("Noms d'Allah")
                    .lightBrownTitle()
                
                Spacer()
                
                Text("1 sur 10")
                    .lightBrownParagraph()
                    .fontWeight(.heavy)
            }
            
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
                Text("Ar-Rahmaan")
                    .lightBrownNameToGuess()
            }
            
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
                Text("الرحمن")
                    .lightBrownNameToGuess()
            }
            
            VStack(alignment: .leading){
                AnswerRow(answer: Answer(text: "Le Tout Miséricordieux", isCorrect: true))
                AnswerRow(answer: Answer(text: "Le Très Miséricordieux", isCorrect: false))
                AnswerRow(answer: Answer(text: "Le Pardonneur", isCorrect: false))
                AnswerRow(answer: Answer(text: "Le Tout Puissant", isCorrect: false))
            }
            
            PrimaryButton(text: "Suivant", background: Color("TextColor"))
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .background(Color("BackgroundColor"))
    }
}

#Preview {
    QuestionView()
}
