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
    @Published private(set) var question: String = ""
    @Published private(set) var answerChoices: [Answer] = []
    @Published private(set) var score = 0
    
    init(){
        // Fetching names from the json files
        fetchNames()
        // Setting the length of the array
        length = names.count
        // Shuffle the whole array
        shuffleQuestions()
        // Setting the first question
        setQuestion()
    }
    
    func shuffleQuestions(){
        print("Shuffling the array..")
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
        print("Setting the question..")
        answerSelected = false
        if currentIndex < names.count{
            /*
            let currentTriviaQuestion = trivia[currentIndex]
            question = currentTriviaQuestion.formattedQuestion
            answerChoices = currentTriviaQuestion.answers
             */
            self.question = getName(index: currentIndex, lang: "transliteration")
            print("The question is \(question)")
            // Setting answers
            setAnswers()
        } else {
            print("The current index \(currentIndex) is inferior to length \(names.count)")
        }
    }
    
    func selectAnswer(answer: Answer){
        answerSelected = true
        if answer.isCorrect {
            score += 1
        }
    }
    
    func setAnswers(){
        do{
            // Define correct answer
            let correct = [Answer(text: names[currentIndex].french, isCorrect: true )]
            // Define incorrect answers
            var incorrects = [Answer]()
            var useIndexes = [Int]()
            useIndexes.append(currentIndex)
            var i = 0
            while i < 3{
                let randomNumber = arc4random_uniform(100)
                if (!useIndexes.contains(Int(randomNumber))){
                    incorrects.append(Answer(text: names[Int(randomNumber)].french, isCorrect: false))
                    useIndexes.append(Int(randomNumber))
                    i += 1
                }
            }
            // Shuffling answer order
            answerChoices = correct + incorrects
            answerChoices.shuffle()
        }
    }
}
