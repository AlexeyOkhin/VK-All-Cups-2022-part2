//
//   DraggingModel.swift
//  VK AllCups 2022 part2
//
//  Created by Djinsolobzik on 14.01.2023.
//

import Foundation


struct DraggingModel {
    var questionText: String
    var numbersInvisibleWords: [Int]
    var wrongAnswersWord: [String]

    var arrayQuestionText: Array<String> {
        return questionText.split(separator: " ") as? Array ?? []
    }

    func makeAnswerWords() -> [String] {
        var trueResultArray = [String]()

        numbersInvisibleWords.forEach { number in
            trueResultArray.append(arrayQuestionText[number - 1])
        }

        return (trueResultArray + wrongAnswersWord).shuffled()
    }

}

#if DEBUG

extension DraggingModel {
    static var makeModels = [
        DraggingModel(questionText: "Текст с несколькими пропусками и вариантами", numbersInvisibleWords: [2,5], wrongAnswersWord: ["по", "над"]),
        DraggingModel(questionText: "Текст с несколькими пропусками и вариантами", numbersInvisibleWords: [2,5], wrongAnswersWord: ["по", "над"]),
        DraggingModel(questionText: "Текст с несколькими пропусками и вариантами", numbersInvisibleWords: [2,5], wrongAnswersWord: ["по", "над"]),
        DraggingModel(questionText: "Текст с несколькими пропусками и вариантами", numbersInvisibleWords: [2,5], wrongAnswersWord: ["по", "над"])
    ]
}

#endif
