//
//  MultistageHeaderReusableView.swift
//  VK AllCups 2022 part2
//
//  Created by Djinsolobzik on 06.01.2023.
//

import UIKit

class MultistageHeaderReusableView: UICollectionReusableView {
    static let reusebleID = "MultistageHeaderReusableView"

    var title: UILabel = {
        let title = UILabel()
        title.text = "Задаем вопрос"
        title.textAlignment = .center
        return title
    }()

    func configure(question: String) {
        backgroundColor = .cyan
        title.text = question
        addSubview(title)

    }

    override func layoutSubviews() {
        super.layoutSubviews()
        title.frame = bounds
    }


}
