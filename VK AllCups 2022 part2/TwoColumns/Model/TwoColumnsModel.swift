//
//  TwoColumnsModel.swift
//  VK AllCups 2022 part2
//
//  Created by Djinsolobzik on 08.01.2023.
//

import Foundation

class TwoColumnsQuestionsModel {
    var quesAnswer: [String: String]

    init(quesAnswer: [String : String]) {
        self.quesAnswer = quesAnswer
    }
}

struct SendAnswer {
    var answer1: String
    var answer2: String
}

#if DEBUG
extension TwoColumnsQuestionsModel {
    static var sampleData = [
        TwoColumnsQuestionsModel(quesAnswer: ["Один": "1", "Два": "2", "Три": "3", "Четыре": "4"]),
        TwoColumnsQuestionsModel(quesAnswer: ["Один": "1", "Два": "2", "Три": "3", "Четыре": "4"]),
        TwoColumnsQuestionsModel(quesAnswer: ["Один": "1", "Два": "2", "Три": "3"]),
        TwoColumnsQuestionsModel(quesAnswer: ["Один": "1", "Два": "2", "Три": "3", "Четыре": "4"]),
        TwoColumnsQuestionsModel(quesAnswer: ["Один": "1", "Два": "2", "Три": "3", "Четыре": "4"]),
        TwoColumnsQuestionsModel(quesAnswer: ["Один": "1", "Два": "2", "Три": "3", "Четыре": "4"])
    ]
}
#endif
