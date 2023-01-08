//
//  MultistageCollectionViewCell.swift
//  VK AllCups 2022 part2
//
//  Created by Djinsolobzik on 06.01.2023.
//

import UIKit

class MultistageCollectionViewCell: UICollectionViewCell {

    static let reusebleID = "MultistageCollectionViewCell"

    //private var statusAnswer = false
    private var buttons = [MultistageCellButton]()

    var didTaped: ((_ id: Int?)-> Void)?

    private lazy var stackButtons: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = .clear
        stack.distribution = .fill
        stack.axis = .vertical
        stack.alignment = .fill
        stack.spacing = 4
        return stack
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        makeConstraint()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        makeConstraint()
    }


    private func makeConstraint() {
        contentView.addSubview(stackButtons)
        stackButtons.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        stackButtons.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        stackButtons.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        stackButtons.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

    }

    func configure(model: QuestionsModel) {
        let answers = model.answers

        for (index, val) in answers.enumerated() {

            let button = MultistageCellButton(answerTitle: val.textAnswer, isTaped: val.isTaped, isAnswerTrue: val.isTrueAnswer)
            button.titleLabel.text = val.textAnswer
            button.percentLabel.text = String(val.pecent) + "%"
            button.tag = index
            button.percentLabel.isHidden = !model.isAnswered
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTap(sender:)))
            button.isUserInteractionEnabled = true
            button.addGestureRecognizer(tapGesture)

            buttons.append(button)

        }
        if stackButtons.arrangedSubviews.isEmpty {
            buttons.forEach { elem in
                stackButtons.addArrangedSubview(elem)
            }
        }
    }

    @objc func didTap(sender: UITapGestureRecognizer) {

        didTaped?(sender.view?.tag)
        //buttons[sender.view?.tag!]
//        buttons.forEach {
//            $0.percentLabel.isHidden = false
//        }

    }

    override func prepareForReuse() {
        super.prepareForReuse()
        buttons = []
        stackButtons.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
    }
    
}
