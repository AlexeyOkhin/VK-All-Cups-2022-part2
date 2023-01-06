//
//  QuestionModel.swift
//  VK AllCups 2022 part2
//
//  Created by Djinsolobzik on 06.01.2023.
//

import Foundation

struct QuestionsModel {
    let question: String
    var answers: [Answer]

}

struct Answer {
    let answer: (answer: String, isTrue: Bool)
}


#if DEBUG

extension QuestionsModel {
    static var sampleData = [
        QuestionsModel(question: "Какое число меньше", answers: [
            Answer(answer: (answer: "Один", isTrue: true)),
            Answer(answer: (answer: "Два", isTrue: false)),
            Answer(answer: (answer: "Три", isTrue: false)),
            //Answer(answer: (answer: "Четыре", isTrue: false))
        ]),
        QuestionsModel(question: "Сколько ног у паука", answers: [
            Answer(answer: (answer: "Одна", isTrue: false)),
            Answer(answer: (answer: "Две", isTrue: true)),
            Answer(answer: (answer: "Восемь", isTrue: false)),
            Answer(answer: (answer: "Четыре", isTrue: false))
        ]),
        QuestionsModel(question: "Какого цвета снег", answers: [
            Answer(answer: (answer: "Белый", isTrue: true)),
            Answer(answer: (answer: "Синий", isTrue: false)),
            Answer(answer: (answer: "Жёлтый", isTrue: false)),
            Answer(answer: (answer: "Красный", isTrue: false))
        ]),
        QuestionsModel(question: "Чей сейчас год", answers: [
            Answer(answer: (answer: "Дракона", isTrue: false)),
            Answer(answer: (answer: "Кабана", isTrue: false)),
            Answer(answer: (answer: "Кролика", isTrue: true)),
            Answer(answer: (answer: "Лисы", isTrue: false))
        ]),
    ]
}
#endif

