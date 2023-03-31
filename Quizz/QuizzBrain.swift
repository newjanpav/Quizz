//
//  QuizzBrain.swift
//  Quizz
//
//  Created by Pavel Shymanski on 29.03.23.
//

import Foundation

struct QuizzBrain {
    
    let quizz = [Quizz(question: "Which is the largest organ in the human body?", answer: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
                 Quizz(question: "Five dollars is worth how many nickels?", answer: ["25", "50", "100"], correctAnswer: "100"),
                 Quizz(question: "What do the letters in the GMT time zone stand for?", answer: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
                 Quizz(question: "What is the French word for 'hat'?", answer: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
                 Quizz(question: "In past times, what would a gentleman keep in his fob pocket?", answer: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
                 Quizz(question: "How would one say goodbye in Spanish?", answer: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
                 Quizz(question: "Which of these colours is NOT featured in the logo for Google?", answer: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
                 Quizz(question: "What alcoholic drink is made from molasses?", answer: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
                 Quizz(question: "What type of animal was Harambe?", answer: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
                 Quizz(question: "Where is Tasmania located?", answer: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
    ]
    
    var currentQuestion = 0
    var score = 0
    
    mutating func getNextQuestion(){
        if currentQuestion < quizz.count - 1 {
            currentQuestion += 1
        }else{
            currentQuestion = 0
            score = 0
        }
    }
    
    
    func getAnswers() -> [String] {
        return quizz[currentQuestion].answer
    }
    
    
    mutating func checkAnswer(currentAnswer answerToCheck: String) -> Bool {
        if answerToCheck == quizz[currentQuestion].correctAnswer {
            score += 1
            return true
            
        }else{
            return false
        }
    }
    
    func showProgress() -> Float {
        let progress =  Float(currentQuestion) / Float(quizz.count)
        return progress
        
    }
}
