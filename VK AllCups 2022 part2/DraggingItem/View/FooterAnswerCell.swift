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

    var viewForMove: UICollectionView?
    var cellFrame: CGRect?

    var startPoint: CGPoint = CGPoint(x: 0, y: 0)

    var xFromCenter: CGFloat = 0

    private lazy var stackAnswers: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = .clear
        stack.distribution = .fillProportionally
        stack.axis = .horizontal
        stack.alignment = .leading
        stack.spacing = 4
        return stack
    }()
    var didResumeButtonTapped: (() -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFooterViews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }

    func configureFooter(arrayAnswer: [String], viewForMove: UICollectionView, cellFrame: CGRect) {
        self.viewForMove = viewForMove
        self.cellFrame = cellFrame
        arrayAnswer.forEach { answer in
            let gesture = UIPanGestureRecognizer()
            gesture.addTarget(self, action: #selector(moveLabel))
            let label = InsetLabel()
            label.isUserInteractionEnabled = true
            label.addGestureRecognizer(gesture)
            label.layer.borderColor = UIColor.black.cgColor
            label.layer.borderWidth = 1
            label.layer.cornerRadius = 16
            label.clipsToBounds = true
            label.text = answer
            label.font = .systemFont(ofSize: 22)
            stackAnswers.addArrangedSubview(label)
        }
    }

    @objc private func didTappedButton() {
        didResumeButtonTapped?()
    }

    @objc private func moveLabel(recognaizer: UIPanGestureRecognizer) {
        let label = recognaizer.view!
        
        let scale = CGAffineTransform(scaleX: 0.8, y: 0.8)

        switch recognaizer.state {
        case .began:
            UIView.animate(withDuration: 0.4) {
                label.backgroundColor = .systemYellow
                label.transform = scale
            }
            startPoint = label.center
        case .changed:

            let translation = recognaizer.translation(in: viewForMove)
            let newX = label.center.x + translation.x
            let newY = label.center.y + translation.y
            if newY < startPoint.y + 20 && newY > startPoint.y - 90 {

                if (CGRectIntersectsRect(cellFrame!, label.frame)) {
                    print("GOAL!!!")
                    }
                
                label.center = CGPoint(x: newX, y: newY)
                recognaizer.setTranslation(.zero, in: viewForMove)
            }

        case .ended:
            let scale = CGAffineTransform(scaleX: 1.0, y: 1.0)
            UIView.animate(withDuration: 0.4) {[weak self] in
                guard let self else { return }
                label.center = self.startPoint
                label.backgroundColor = .clear
                label.transform = scale
            }

        case .possible:
            print("possible")
        case .cancelled:
            print("cancelled")
        case .failed:
            print("failed")
        @unknown default:
            print("error gesture")
        }
    }
    private func setupFooterViews()   {


        addSubview(stackAnswers)

        NSLayoutConstraint.activate([
            stackAnswers.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            stackAnswers.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            stackAnswers.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16)
        ])

    }
    override func prepareForReuse() {
        super.prepareForReuse()
        stackAnswers.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
    }
}
