//
//  QuestionModel.swift
//  VK AllCups 2022 part2
//
//  Created by Djinsolobzik on 06.01.2023.
//

import Foundation

final class QuestionsModel {
    var isAnswered = false
    let question: String
    var answers: [Answer]
    var countRespondPeople: Int {
        get {
            answers.reduce( 0, {$0 + $1.countEnter})
        }
    }
    init(isAnswered: Bool = false, question: String, answers: [Answer]) {
        self.isAnswered = isAnswered
        self.question = question
        self.answers = answers
    }

    func resetViews() {
        isAnswered = false
        for i in 0...answers.count - 1 {
            answers[i].isTaped = false
        }

    }

    func getPercents() {
        for i in 0...answers.count - 1 {
            answers[i].pecent = answers[i].countEnter * 100 / countRespondPeople
        }
    }
}

struct Answer {

    let textAnswer: String
    var isTrueAnswer: Bool
    var countEnter: Int
    var isTaped: Bool
    var pecent = 0

}

#if DEBUG
extension QuestionsModel {
    static var sampleData = [
        QuestionsModel(question: "В каком году был представлен Swift", answers: [
            Answer(textAnswer: "2011", isTrueAnswer: false, countEnter: 0, isTaped: false),
            Answer(textAnswer: "2012", isTrueAnswer: false, countEnter: 0, isTaped: false),
            Answer(textAnswer: "2013", isTrueAnswer: false, countEnter: 0, isTaped: false),
            Answer(textAnswer: "2014", isTrueAnswer: true, countEnter: 0, isTaped: false),
            Answer(textAnswer: "2016", isTrueAnswer: false, countEnter: 0, isTaped: false)

        ]),
        QuestionsModel(question: "В каком году был представлен Swift", answers: [
            Answer(textAnswer: "2011", isTrueAnswer: false, countEnter: 0, isTaped: false),
            Answer(textAnswer: "2012", isTrueAnswer: false, countEnter: 0, isTaped: false),
            Answer(textAnswer: "2013", isTrueAnswer: false, countEnter: 0, isTaped: false),
            Answer(textAnswer: "2014", isTrueAnswer: true, countEnter: 0, isTaped: false)

        ]),
        QuestionsModel(question: "В каком году был представлен Swift", answers: [
            Answer(textAnswer: "2011", isTrueAnswer: false, countEnter: 0, isTaped: false),
            Answer(textAnswer: "2012", isTrueAnswer: false, countEnter: 0, isTaped: false),
            Answer(textAnswer: "2013", isTrueAnswer: false, countEnter: 0, isTaped: false),
            Answer(textAnswer: "2014", isTrueAnswer: true, countEnter: 0, isTaped: false)

        ]),
        QuestionsModel(question: "В каком году был представлен Swift", answers: [
            Answer(textAnswer: "2011", isTrueAnswer: false, countEnter: 0, isTaped: false),
            Answer(textAnswer: "2012", isTrueAnswer: false, countEnter: 0, isTaped: false),
            Answer(textAnswer: "2013", isTrueAnswer: false, countEnter: 0, isTaped: false),
            Answer(textAnswer: "2014", isTrueAnswer: true, countEnter: 0, isTaped: false)

        ]),
        QuestionsModel(question: "В каком году был представлен Swift", answers: [
            Answer(textAnswer: "2011", isTrueAnswer: false, countEnter: 0, isTaped: false),
            Answer(textAnswer: "2012", isTrueAnswer: false, countEnter: 0, isTaped: false),
            Answer(textAnswer: "2013", isTrueAnswer: false, countEnter: 0, isTaped: false),
            Answer(textAnswer: "2014", isTrueAnswer: true, countEnter: 0, isTaped: false)

        ]),
        QuestionsModel(question: "В каком году был представлен Swift", answers: [
            Answer(textAnswer: "2011", isTrueAnswer: false, countEnter: 0, isTaped: false),
            Answer(textAnswer: "2012", isTrueAnswer: false, countEnter: 0, isTaped: false),
            Answer(textAnswer: "2013", isTrueAnswer: false, countEnter: 0, isTaped: false),
            Answer(textAnswer: "2014", isTrueAnswer: true, countEnter: 0, isTaped: false)

        ]),
        QuestionsModel(question: "В каком году был представлен Swift", answers: [
            Answer(textAnswer: "2011", isTrueAnswer: false, countEnter: 0, isTaped: false),
            Answer(textAnswer: "2012", isTrueAnswer: false, countEnter: 0, isTaped: false),
            Answer(textAnswer: "2013", isTrueAnswer: false, countEnter: 0, isTaped: false),
            Answer(textAnswer: "2014", isTrueAnswer: true, countEnter: 0, isTaped: false)

        ]),
//        QuestionsModel(question: "Сколько ног у паука", answers: [
//            Answer(answer: (answer: "Одна", isTrue: false, isSelected: false)),
//            Answer(answer: (answer: "Две", isTrue: true, isSelected: false)),
//            Answer(answer: (answer: "Восемь", isTrue: false, isSelected: false)),
//            Answer(answer: (answer: "Четыре", isTrue: false, isSelected: false))
//        ]),
//        QuestionsModel(question: "Какого цвета снег", answers: [
//            Answer(answer: (answer: "Белый", isTrue: true, isSelected: false)),
//            Answer(answer: (answer: "Синий", isTrue: false, isSelected: false)),
//            Answer(answer: (answer: "Жёлтый", isTrue: false, isSelected: false)),
//            Answer(answer: (answer: "Красный", isTrue: false, isSelected: false))
//        ]),
//        QuestionsModel(question: "Чей сейчас год", answers: [
//            Answer(answer: (answer: "Дракона", isTrue: false, isSelected: false)),
//            Answer(answer: (answer: "Кабана", isTrue: false, isSelected: false)),
//            Answer(answer: (answer: "Кролика", isTrue: true, isSelected: false)),
//            Answer(answer: (answer: "Лисы", isTrue: false, isSelected: false))
//        ]),
    ]
}
#endif




