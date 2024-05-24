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
        var transliteration: String
        var french: String
        var arabic: String
        var description: String
        var incorrectAnswers: [String]
    }
}
