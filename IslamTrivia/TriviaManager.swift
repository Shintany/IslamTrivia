//
//  TriviaManager.swift
//  IslamTrivia
//
//  Created by Irchad TUAN-KITCHIL on 26/05/2024.
//

import Foundation

class TriviaManager : ObservableObject{
    private(set) var trivia: [Trivia.Result] = []
    
    var currentIndex : Int = 0
    var names : [Name] = []
    var filename : String = "names"
    var length : Int = 0
    struct Name : Decodable{
        var transliteration: String
        var french: String
        var arabic: String
        var description: String
    }
    
    @Published private(set) var answerSelected = false
    @Published private(set) var question: AttributedString = ""
    @Published private(set) var answerChoices: [Answer] = []
    @Published private(set) var score = 0
    
    init(){
        fetchNames()
        length = names.count
    }
    
    func shuffleQuestions(){
        self.names.shuffle()
    }
    
    func fetchNames(){
        do{
            print("Fetching names...");
            if let filePath = Bundle.main.path(forResource: filename, ofType: "json"){
                print("I try fecthing names...")
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                names = try JSONDecoder().decode([Name].self, from: data)
                print("names length: \(names.count)")
            } else{
                print("Couldn't fetch names...")
            }
        } catch{
            print("ERROR : \(error)")
        }
    }
    
    func getName(index: Int, lang: String) -> String{
        if(index < 0 && index > 99){
            print("TriviaManager.getName : ERROR index parameter should be between 0 and 99 included")
            return "";
        }
        
        return self.names[index].transliteration
    }
    
    func goToNextQuestion(){
        if(currentIndex + 1 < names.count){
            print("Increasing the index...")
            currentIndex += +1
            setQuestion()
        }
        else{
            print("Shuffling the array again and resetting index to 0...")
            names.shuffle()
            currentIndex = 0
        }
    }
    
    func setQuestion(){
        answerSelected = false
        
        if currentIndex < length{
            let currentTriviaQuestion = trivia[currentIndex]
            question = currentTriviaQuestion.formattedQuestion
            answerChoices = currentTriviaQuestion.answers
        }
    }
    
    func selectAnswer(answer: Answer){
        answerSelected = true
        if answer.isCorrect {
            score += 1
        }
    }
}
