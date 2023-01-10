//
//  TwoColumnsCell.swift
//  VK AllCups 2022 part2
//
//  Created by Djinsolobzik on 08.01.2023.
//

import UIKit

class TwoColumnsCell: UICollectionViewCell {

    static let reusebleID = "TwoColumnsCell"

    var didTaped: ((_ answerArray: [AnswerColumnsButton])-> Void)?
    var sendArrayTaped = [AnswerColumnsButton]()
    var isFinished = false

    private var keyButtons = [UIButton]()
    private var valueButtons = [UIButton]()

    private lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = .clear
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 2
        return stack
    }()

    private lazy var stackLeftButtons: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = .clear
        stack.distribution = .fill
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 8
        return stack
    }()

    private lazy var stackRightButtons: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = .clear
        stack.distribution = .fill
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 8
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
      
    }

    func configure(model: TwoColumnsQuestionsModel) {
        model.quesAnswer.forEach({ (key: String, value: String) in
            keyButtons.shuffle()
            valueButtons.shuffle()
            let keyButton = AnswerColumnsButton(title: key)
            keyButton.addTarget(self, action: #selector(didTap(sender: )), for: .touchUpInside)
            keyButton.contentEdgeInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
            //keyButton.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)

            let valueButton = AnswerColumnsButton(title: value)
            valueButton.isKey = false
            valueButton.addTarget(self, action: #selector(didTap(sender: )), for: .touchUpInside)
            valueButton.contentEdgeInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
            //valueButton.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)

            keyButtons.append(keyButton)
            valueButtons.append(valueButton)

        })

        if stackLeftButtons.arrangedSubviews.isEmpty && stackRightButtons.arrangedSubviews.isEmpty {

            keyButtons.forEach { elem in
                stackLeftButtons.addArrangedSubview(elem)
            }

            valueButtons.forEach { elem in
                stackRightButtons.addArrangedSubview(elem)
            }
        }
    }

    @objc private func didTap(sender: AnswerColumnsButton) {
        if !isFinished {
            sender.backgroundColor = .systemYellow
            sender.isEnabled = false
            sendArrayTaped.append(sender)
            if sendArrayTaped.count == 2 {
                if sendArrayTaped[0].isKey != sendArrayTaped[1].isKey {
                    didTaped?(sendArrayTaped)
                    sendArrayTaped = []
                } else {
                    sendArrayTaped[0].isEnabled = true
                    sendArrayTaped[1].isEnabled = true
                    sendArrayTaped[0].backgroundColor = .white
                    sendArrayTaped[1].backgroundColor = .white
                    sendArrayTaped = []
                }
            }
        }
    }

    private func makeConstraint() {

        mainStack.addArrangedSubview(stackLeftButtons)
        mainStack.addArrangedSubview(stackRightButtons)

        contentView.addSubview(mainStack)
        mainStack.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        mainStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        mainStack.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        mainStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16).isActive = true
        mainStack.widthAnchor.constraint(equalToConstant: 350).isActive = true
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layer.cornerRadius = 8
        contentView.layer.borderColor = UIColor.systemGray.cgColor
        contentView.layer.borderWidth = 1
    }
}
