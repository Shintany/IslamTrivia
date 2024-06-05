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
                
                Text("Score : \(triviaManager.score)")
                    .lightBrownParagraph()
                    .fontWeight(.heavy)
            }
            
            Spacer()
            
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
                Text(triviaManager.question)
                    .lightBrownNameToGuess()
            }
            
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
                Text(triviaManager.secondaryQuestion)
                    .lightBrownNameToGuess()
            }
            
            Spacer()
            
            VStack(spacing:10){
                ForEach(triviaManager.answerChoices, id: \.id){
                    answer in AnswerRow(answer: answer)
                        .environmentObject(triviaManager)
                }
            }
            
            Button{
                triviaManager.goToNextQuestion()
            } label: {
                PrimaryButton(text: "Suivant", background: triviaManager.answerSelected ? Color("TextColor") : Color(hue: 1.0, saturation: 0.0, brightness: 0.564, opacity: 0.327))
            }
            .disabled(!triviaManager.answerSelected)
            
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
