//
//  DraggingCell.swift
//  VK AllCups 2022 part2
//
//  Created by Djinsolobzik on 14.01.2023.
//

import UIKit

class DraggingCell: UICollectionViewCell {

    static let reuseID = "DraggingCell"

    private var arrayQuestionLabels = [UILabel]()
    //private var arrayAnswerLabels = [UILabel]()

//    private lazy var bottomStack: UIStackView = {
//        let stack = UIStackView()
//        stack.translatesAutoresizingMaskIntoConstraints = false
//        stack.backgroundColor = .clear
//        stack.distribution = .fillEqually
//        stack.axis = .horizontal
//        stack.alignment = .leading
//        stack.spacing = 4
//        return stack
//    }()
//

    override init(frame: CGRect) {
        super.init(frame: frame)
        makeConstreints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func configureCell(model: DraggingModel) {
        model.arrayQuestionText.forEach { word in
            let label = UILabel()
            label.text = word
            arrayQuestionLabels.append(label)
        }

        model.answerWords.forEach { word in
            let label = UILabel()
            label.text = word
            arrayAnswerLabels.append(label)
            bottomStack.addArrangedSubview(label)
        }
    }

    private func makeConstreints() {

        contentView.addSubview(bottomStack)
        bottomStack.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        bottomStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        bottomStack.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        bottomStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16).isActive = true
        bottomStack.widthAnchor.constraint(equalToConstant: 350).isActive = true
    }
}
