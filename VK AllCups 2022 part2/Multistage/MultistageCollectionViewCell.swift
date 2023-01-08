//
//  MultistageCollectionViewCell.swift
//  VK AllCups 2022 part2
//
//  Created by Djinsolobzik on 06.01.2023.
//

import UIKit

final class MultistageCollectionViewCell: UICollectionViewCell {

    static let reusebleID = "MultistageCollectionViewCell"

    var didTaped: ((_ id: Int?)-> Void)?

    private var buttons = [MultistageCellButton]()

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

    override func prepareForReuse() {
        super.prepareForReuse()
        buttons = []
        stackButtons.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
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

    @objc private func didTap(sender: UITapGestureRecognizer) {

        didTaped?(sender.view?.tag)
        //sender.view?.backgroundColor = .red
        //updateTheme()
        //bounce()
        //buttons[sender.view?.tag!]
//        buttons.forEach {
//            $0.percentLabel.isHidden = false
//        }

    }
    private func makeConstraint() {
        contentView.addSubview(stackButtons)
        stackButtons.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        stackButtons.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        stackButtons.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        stackButtons.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }

    private func bounce(_ bounce: Bool) {
        UIView.animate(
            withDuration: 0.8,
            delay: 0,
            usingSpringWithDamping: 0.4,
            initialSpringVelocity: 0.8,
            options: [.allowUserInteraction, .beginFromCurrentState],
            animations: { self.transform = bounce ? CGAffineTransform(scaleX: 0.8, y: 0.8) : .identity },
            completion: nil)
    }

}
