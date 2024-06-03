//
//  Trivia.swift
//  IslamTrivia
//
//  Created by Irchad TUAN-KITCHIL on 23/05/2024.
//

import Foundation

struct Trivia : Decodable{
    var results: [Result]
    
    struct Result: Decodable, Identifiable{
        var id: UUID{
            UUID()
        }
        
        var correctAnswer: String
        var incorrectAnswers: [String]
        var question: String

        var formattedQuestion: AttributedString{
            do{
                return try AttributedString(markdown: question)
            }catch{
                print("Error setting formattedQuestion: \(error)")
                return ""
            }
        }
        
        var answers: [Answer] {
            do{
                let correct = [Answer(text: correctAnswer, isCorrect: true )]
                let incorrects = try incorrectAnswers.map{ answer in
                    Answer(text: answer, isCorrect: false)
                }
                let allAnswers = correct + incorrects
                
                return allAnswers.shuffled()
            }catch{
                print("Error setting answers: \(error)")
                return []
            }
        }
    }
}
