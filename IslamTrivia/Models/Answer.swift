//
//  Answer.swift
//  IslamTrivia
//
//  Created by Irchad TUAN-KITCHIL on 23/05/2024.
//

import Foundation

struct Answer: Identifiable{
    var id = UUID()
    var text: AttributedString
    var isCorrect: Bool
}
