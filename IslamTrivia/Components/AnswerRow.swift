//
//  AnswerRow.swift
//  IslamTrivia
//
//  Created by Irchad TUAN-KITCHIL on 23/05/2024.
//

import SwiftUI

struct AnswerRow: View {
    @EnvironmentObject var triviaManager : TriviaManager
    var answer: Answer
    @State private var isSelected = false
    
    var body: some View {
        HStack(spacing:20){
            Image(systemName: "circle.fill")
                .font(.caption)
            Text(answer.text)
                .bold()
            
            if(isSelected){
                Spacer()
                
                Image(systemName: answer.isCorrect ?
                      "checkmark.seal.fill" : "xmark.circle.fill")
                .foregroundColor(answer.isCorrect ?
                    .green : .red)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(triviaManager.answerSelected ? (isSelected ? Color("TextColor") : (answer.isCorrect ? Color("TextColor") : .gray)) : Color("TextColor"))
        .background(Color("AnswerBackgroundColor"))
        .cornerRadius(10)
        //.shadow(color: isSelected ? (answer.isCorrect ? .green : .red ) : .gray, radius: 5, x:0.5, y: 0.5)
        .shadow(color: triviaManager.answerSelected ? (isSelected ? (answer.isCorrect ? .green : .red ) : (answer.isCorrect ? .green : .gray)) : .gray, radius: 5, x:0.5, y: 0.5)
        .onTapGesture {
            if !triviaManager.answerSelected{
                isSelected = true
                triviaManager.selectAnswer(answer: answer)
            }
        }
    }
}

#Preview {
    AnswerRow(answer: Answer(text: "Allah", isCorrect: true))
        .environmentObject(TriviaManager())
}
