//
//  TitleRatingStarCell.swift
//  VK AllCups 2022 part2
//
//  Created by Djinsolobzik on 12.01.2023.
//

import UIKit

class TitleRatingStarCell: UICollectionViewCell {
    static let reusebleID = "TitleRatingStarCell"

    var rating = 0

    private lazy var mainStack: StartsStack = {
        let stack = StartsStack()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = .clear
        stack.distribution = .fillProportionally
        stack.axis = .horizontal
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

    }

    override func prepareForReuse() {
        super.prepareForReuse()
        mainStack.rating = 0
    }

    func configure(model: TitleRatingStarModel) {
        rating = mainStack.rating

    }

    private func makeConstraint() {

        contentView.addSubview(mainStack)
        mainStack.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 30).isActive = true
        mainStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        mainStack.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -30).isActive = true
        mainStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16).isActive = true
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layer.cornerRadius = 8
        contentView.layer.borderColor = UIColor.systemGray6.cgColor
        contentView.layer.borderWidth = 1
    }
}
