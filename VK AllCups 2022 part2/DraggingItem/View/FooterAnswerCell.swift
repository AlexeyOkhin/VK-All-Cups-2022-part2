//
//  FooterAnswerCell.swift
//  VK AllCups 2022 part2
//
//  Created by Djinsolobzik on 14.01.2023.
//

import UIKit

final class FooterAnswerCell: UICollectionReusableView  {

    static let identifireID = "\(FooterAnswerCell.self)"

    var answerArray = [UILabel]()

    var didResumeButtonTapped: (() -> Void)?

    private let stack: UIStackView = {
        let stack  = UIStackView()
        stack.alignment = .leading
        return stack
    }()

    private let heightButton: CGFloat = 80

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHeaderViews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }

    @objc private func didTappedButton() {
        didResumeButtonTapped?()
    }

    private func setupHeaderViews()   {
//        addSubview(resumeButton)
//
//        NSLayoutConstraint.activate([
//            resumeButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 20),
//            resumeButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            resumeButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.6),
//            resumeButton.heightAnchor.constraint(equalToConstant: heightButton)
//        ])

    }

}
