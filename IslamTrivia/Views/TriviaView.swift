//
//  TriviaView.swift
//  IslamTrivia
//
//  Created by Irchad TUAN-KITCHIL on 23/05/2024.
//

import SwiftUI

struct TriviaView: View {
    @EnvironmentObject var triviaManager : TriviaManager
    
    var body: some View {
        QuestionView()
            .environmentObject(triviaManager)
    }
}

#Preview {
    TriviaView()
        .environmentObject(TriviaManager())
}
