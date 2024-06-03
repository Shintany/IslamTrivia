//
//  QuestionView.swift
//  IslamTrivia
//
//  Created by Irchad TUAN-KITCHIL on 23/05/2024.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var triviaManager : TriviaManager
    
    var body: some View {
        VStack(spacing:40){
            HStack{
                Text("Noms d'Allah")
                    .lightBrownTitle()
                
                Spacer()
                
                Text("\(triviaManager.currentIndex + 1) sur \(triviaManager.length)")
                    .lightBrownParagraph()
                    .fontWeight(.heavy)
            }
            
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
                Text(triviaManager.question)
                    .lightBrownNameToGuess()
            }
            
            VStack(spacing:10){
                ForEach(triviaManager.answerChoices, id: \.id){
                    answer in AnswerRow(answer: answer)
                        .environmentObject(triviaManager)
                }
            }
            
            PrimaryButton(text: "Suivant", background: Color("TextColor"))
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .background(Color("BackgroundColor"))
        .navigationBarBackButtonHidden(true)
        
    }
}

#Preview {
    QuestionView()
        .environmentObject(TriviaManager())
}
