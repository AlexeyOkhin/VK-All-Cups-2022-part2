//
//  TwoColumnsCollectionViewController.swift
//  VK AllCups 2022 part2
//
//  Created by Djinsolobzik on 08.01.2023.
//

import UIKit

class TwoColumnsCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    private let questions = TwoColumnsQuestionsModel.sampleData

    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = CGSize(width: 350, height: 500)
        self.collectionView.collectionViewLayout = layout

        // Register cell classes
        self.collectionView!.register(TwoColumnsCell.self, forCellWithReuseIdentifier: TwoColumnsCell.reusebleID)


        // Configure Collection
        self.collectionView.showsVerticalScrollIndicator = false
        collectionView.allowsMultipleSelection = false

    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {

        return 100
        //questions.count * 10
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return 1
        //questions[section % questions.count].answers.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TwoColumnsCell.reusebleID, for: indexPath) as! TwoColumnsCell
        cell.configure(model: questions[indexPath.section % questions.count])

        cell.didTaped = { [weak self] answerArray in
            guard let self else { return }
            let keyButton = answerArray[0].titleLabel?.text
            let valueButton = answerArray[1].titleLabel?.text

            if self.questions[indexPath.section % self.questions.count].quesAnswer.contains(where: { key, value in
                key == keyButton && value == valueButton
            }) {
                self.animationTap(color: .green, animationElement: answerArray[0])
                self.animationTap(color: .green, animationElement: answerArray[1])
            } else {
                self.animationTap(color: .red, animationElement: answerArray[0])
                self.animationTap(color: .red, animationElement: answerArray[1])
                cell.isFinished = true
            }

        }

        return cell
    }

    // MARK: UICollectionViewDelegate

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        return inset
    }

    //MARK: - Private methods


    private func animationTap(color: UIColor, animationElement: UIView) {
        UIView.animate(withDuration: 0.4, delay: 0) {
            animationElement.backgroundColor = color
        }
    }

//    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        var offset = collectionView.contentOffset
//        let height = collectionView.contentSize.height
//        if offset.y < height/4 {
//            offset.y += height/2
//            collectionView.setContentOffset(offset, animated: false)
//        } else if offset.y > height/4 * 3 {
//            offset.y -= height/2
//            collectionView.setContentOffset(offset, animated: false)
//        }
//    }

//    override func viewDidLayoutSubviews() {
//          super.viewDidLayoutSubviews()
//        self.collectionView.scrollToItem(at: IndexPath(item: 1, section: 20), at: .left, animated: true)
//        }

}
