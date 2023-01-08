//
//  MultistageCellButton.swift
//  VK AllCups 2022 part2
//
//  Created by Djinsolobzik on 07.01.2023.
//

import UIKit

class MultistageCellButton: UIView {

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()

    lazy var answerTrueImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    lazy var percentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .right
        label.isHidden = true
        label.text = "0%"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()

    init(answerTitle: String, isTaped: Bool, isAnswerTrue: Bool) {
        super.init(frame: .zero)

        titleLabel.text = answerTitle

        configure()

        answerTrueImage.image = isAnswerTrue ? UIImage(systemName: "checkmark") : UIImage(systemName: "xmark")
        answerTrueImage.tintColor = isAnswerTrue ? UIColor(named: "checkColor") : .red
        answerTrueImage.isHidden = !isTaped
        if isTaped && isAnswerTrue{
            self.backgroundColor = UIColor(named: "trueCellColor")
        }

        //percentLabel.isHidden = !isTaped
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {

        self.backgroundColor = UIColor(red: 0.92, green: 0.92, blue: 0.92, alpha: 1)

        addSubview(titleLabel)
        addSubview(answerTrueImage)
        addSubview(percentLabel)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),

            percentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            percentLabel.widthAnchor.constraint(equalToConstant: 48),
            percentLabel.centerYAnchor.constraint(equalTo: centerYAnchor),

            answerTrueImage.widthAnchor.constraint(equalToConstant: 24),
            answerTrueImage.heightAnchor.constraint(equalToConstant: 24),
            answerTrueImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            answerTrueImage.trailingAnchor.constraint(equalTo: percentLabel.leadingAnchor, constant: -16)
        ])
        
    }
}
