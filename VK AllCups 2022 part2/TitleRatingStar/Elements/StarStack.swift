//
//  StarStack.swift
//  VK AllCups 2022 part2
//
//  Created by Djinsolobzik on 12.01.2023.
//

import UIKit


class StartsStack: UIStackView {

    var rating = 0 {
        didSet {
            updateButtonSelectionState()
        }
    }

    private var starCount = 5
    private var starHeightSize: CGFloat = 44
    private var starWidthSize: CGFloat = 44



    private var starBattons = [UIButton]()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupButtons()
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)
    }

    @objc private func ratingButtonTap(button: UIButton) {
        animamationStar(button: button)
        guard let index = starBattons.firstIndex(of: button) else { return }

        let selectedRating = index + 1

        if selectedRating == rating {
            rating = 0
        } else {
            rating = selectedRating
        }
    }

    private func setupButtons() {
        let largeConfig = UIImage.SymbolConfiguration(textStyle: .largeTitle, scale: .large)

        let filledStar = UIImage(systemName: "star.fill", withConfiguration: largeConfig)
        let emptyStar = UIImage(systemName: "star", withConfiguration: largeConfig)
        let higlitedStar = UIImage(systemName: "star.fill", withConfiguration: largeConfig)

        for _ in 0..<starCount {
            let button = UIButton()
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(higlitedStar, for: .highlighted)
            button.setImage(higlitedStar, for: [.highlighted, .selected])
            button.tintColor = UIColor(named: "starColor")

            button.translatesAutoresizingMaskIntoConstraints = false

            button.heightAnchor.constraint(equalToConstant: starHeightSize).isActive = true
            button.widthAnchor.constraint(equalToConstant: starWidthSize).isActive = true

            button.addTarget(self, action: #selector(ratingButtonTap), for: .touchUpInside)

            addArrangedSubview(button)
            starBattons.append(button)
        }
    }

    private func updateButtonSelectionState() {
        for (index, button) in starBattons.enumerated() {
            button.isSelected = index < rating
        }
    }

    private func animamationStar(button: UIButton) {

        button.transform = CGAffineTransformMakeScale(-1, 1)

        UIView.animate(withDuration: 0.4, animations: {

            button.transform = CGAffineTransformMakeScale(1,1)

        })
    }
}
