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

    var arrayQuestionText: [(String, Bool)] {

        let array = questionText.split(separator: " ").enumerated().map { (index, word) in
            if index == numbersInvisibleWords[0] - 1 || index == numbersInvisibleWords[1] - 1 {
                return (String(word), false)
            } else {
                return (String(word), true)
            }
        }
    
        return array
    }

    var answerWords: [String] {
        get {
            var trueResultArray = [String]()
            numbersInvisibleWords.forEach { number in
                trueResultArray.append(arrayQuestionText[number - 1].0)
            }

            return (trueResultArray + wrongAnswersWord).shuffled()
        }
    }
}

#if DEBUG

extension DraggingModel {
    static var makeModels = [
        DraggingModel(questionText: "Текст с несколькими пропусками и вариантами", numbersInvisibleWords: [2,6], wrongAnswersWord: ["по", "над"]),
        DraggingModel(questionText: "Текст с несколькими пропусками и вариантами", numbersInvisibleWords: [1,5], wrongAnswersWord: ["по", "над"]),
        DraggingModel(questionText: "Текст с несколькими пропусками и вариантами", numbersInvisibleWords: [2,5], wrongAnswersWord: ["по", "над"]),
        DraggingModel(questionText: "Текст с несколькими пропусками и вариантами", numbersInvisibleWords: [3,5], wrongAnswersWord: ["по", "над"]),
        DraggingModel(questionText: "Текст с несколькими пропусками и вариантами", numbersInvisibleWords: [2,5], wrongAnswersWord: ["по", "над"]),
        DraggingModel(questionText: "Текст с несколькими пропусками и вариантами", numbersInvisibleWords: [2,5], wrongAnswersWord: ["по", "над"]),
        DraggingModel(questionText: "Текст с несколькими пропусками и вариантами", numbersInvisibleWords: [2,5], wrongAnswersWord: ["по", "над"])
    ]
}

#endif
