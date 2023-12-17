//
//  Questions.swift
//  Quizlet
//
//  Created by Ramazan Kalabay on 15.12.2023.
//

import Foundation

struct Questions {
    let text: String
    let answerQuestion: String
    let wrong1: String
    let wrong2: String
    
    init(quest: String, answer: String, wrongAnswer1: String, wrongAnswer2: String) {
        wrong1 = wrongAnswer1
        wrong2 = wrongAnswer2
        text = quest
        answerQuestion = answer
        
    }

}
