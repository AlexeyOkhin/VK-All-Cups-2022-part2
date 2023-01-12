//
//  TitleRatingStarModel.swift
//  VK AllCups 2022 part2
//
//  Created by Djinsolobzik on 12.01.2023.
//

import Foundation

struct TitleRatingStarModel {
    var rating: Int
    var title: String
}



#if DEBUG
extension TitleRatingStarModel {
    static var sempleData = [
        TitleRatingStarModel(rating: 0, title: "Интересная статья"),
        TitleRatingStarModel(rating: 0, title: "Не очень интересная статья"),
        TitleRatingStarModel(rating: 0, title: "Совсем не интересная статья"),
        TitleRatingStarModel(rating: 0, title: "Очень интересная статья"),
        TitleRatingStarModel(rating: 0, title: "Супер статья")
    ]
}
#endif

