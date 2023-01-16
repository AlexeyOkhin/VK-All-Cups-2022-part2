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

    override init(frame: CGRect) {
        super.init(frame: frame)
        makeConstraint()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }

    private lazy var mainContainer = UIView()

    private lazy var labelTitle: UILabel? = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 22)
        label.textColor = .black
        label.backgroundColor = .clear
        return label
    }()

    private func makeConstraint() {
        guard let labelTitle else { return }
        contentView.addSubview(labelTitle)
        labelTitle.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            labelTitle.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            labelTitle.topAnchor.constraint(equalTo: contentView.topAnchor),
            labelTitle.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            labelTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    func configure(model: (String, Bool)) {
        guard let labelTitle else { return }
        labelTitle.text = model.0
        if !model.1 {
            labelTitle.backgroundColor = .systemGray5
            labelTitle.textColor = .systemGray5
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
       labelTitle = nil
    }
}
