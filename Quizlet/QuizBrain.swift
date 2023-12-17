//
//  QuizBrain.swift
//  Quizlet
//
//  Created by Ramazan Kalabay on 15.12.2023.
//

import Foundation

struct QuizBrain{
    
    
    let quiz = [
        Questions(quest: "Какая река является самой длинной в мире?", answer: "Амазонка", wrongAnswer1: "Нил", wrongAnswer2: "Миссисипи"),
        Questions(quest: "Кто написал 'Ромео и Джульетта'?", answer: "Уильям Шекспир", wrongAnswer1: "Федор Достоевский", wrongAnswer2: "Джейн Остин"),
        Questions(quest: "Сколько планет в Солнечной системе?", answer: "Восемь", wrongAnswer1: "Девять", wrongAnswer2: "Семь"),
        Questions(quest: "Что представляет собой E=mc^2?", answer: "Теория относительности", wrongAnswer1: "Закон сохранения энергии", wrongAnswer2: "Химическая формула"),
        Questions(quest: "Какой элемент периодической таблицы обозначается как 'Fe'?", answer: "Железо", wrongAnswer1: "Фтор", wrongAnswer2: "Фосфор"),
        Questions(quest: "Кто является автором 'Игры Престолов'?", answer: "Джордж Р. Р. Мартин", wrongAnswer1: "Дж. К. Роулинг", wrongAnswer2: "Толкин"),
        Questions(quest: "Как называется столица Японии?", answer: "Токио", wrongAnswer1: "Сеул", wrongAnswer2: "Пекин"),
        Questions(quest: "Какой год считается началом нового тысячелетия?", answer: "2001", wrongAnswer1: "2000", wrongAnswer2: "1999"),
        Questions(quest: "Какое животное является символом Австралии?", answer: "Кенгуру", wrongAnswer1: "Коала", wrongAnswer2: "Вомбат"),
        Questions(quest: "Кто изображен на американской сотне долларов?", answer: "Бенджамин Франклин", wrongAnswer1: "Джордж Вашингтон", wrongAnswer2: "Авраам Линкольн"),
        Questions(quest: "Какой год был провозглашен Годом Революции в России?", answer: "1917", wrongAnswer1: "1905", wrongAnswer2: "1921"),
        Questions(quest: "Какое море находится между Африкой и Евразией?", answer: "Средиземное", wrongAnswer1: "Красное", wrongAnswer2: "Черное"),
        Questions(quest: "Кто является основателем компании Apple?", answer: "Стив Джобс", wrongAnswer1: "Билл Гейтс", wrongAnswer2: "Марк Цукерберг"),
        Questions(quest: "Какая самая высокая гора в мире?", answer: "Эверест", wrongAnswer1: "К2", wrongAnswer2: "Канченджанга"),
        Questions(quest: "Какой элемент периодической таблицы обозначается как 'Au'?", answer: "Золото", wrongAnswer1: "Серебро", wrongAnswer2: "Платина"),
        Questions(quest: "В каком году завершилась Вторая мировая война?", answer: "1945", wrongAnswer1: "1939", wrongAnswer2: "1941"),
        Questions(quest: "Какой город является столицей Канады?", answer: "Оттава", wrongAnswer1: "Торонто", wrongAnswer2: "Ванкувер"),
        Questions(quest: "Как называется космический аппарат, высажившийся на Луне в 1969 году?", answer: "Аполлон-11", wrongAnswer1: "Спутник-1", wrongAnswer2: "Восход-1"),
        Questions(quest: "Кто написал 'Война и мир'?", answer: "Лев Толстой", wrongAnswer1: "Федор Достоевский", wrongAnswer2: "Александр Пушкин"),
        Questions(quest: "Какая планета считается Красной планетой?", answer: "Марс", wrongAnswer1: "Венера", wrongAnswer2: "Юпитер")
    ]

    
    var questionNumber = 0
    var ScoreNumber = 0
    
    mutating func nextQuestion(){
            if questionNumber + 1 < quiz.count{
                questionNumber += 1
            } else {
                questionNumber = 0
                ScoreNumber = 0
            }
    }
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool{
        if userAnswer == quiz[questionNumber].answerQuestion{
            ScoreNumber += 1
            return true
        } else{
            return false
        }
    }
    
    
    func getChoiceAnswer() -> [String] {
        var answers = [quiz[questionNumber].answerQuestion,
                       quiz[questionNumber].wrong1,
                       quiz[questionNumber].wrong2]
        answers.shuffle()  
        return answers
    }
    
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    func getProgress() -> Float{
        let progress = Float(questionNumber) / Float(quiz.count)
        return progress
    }
    
    func getScore() -> String{
        return String("Score: \(ScoreNumber)")
    }
}
