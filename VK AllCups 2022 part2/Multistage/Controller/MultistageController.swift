//
//  MultistageController.swift
//  VK AllCups 2022 part2
//
//  Created by Djinsolobzik on 06.01.2023.
//

import UIKit

class MultistageController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let questions = QuestionsModel.sampleData

    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = CGSize(width: 350, height: 500)
        self.collectionView.collectionViewLayout = layout

        // Register cell classes
        self.collectionView!.register(MultistageCollectionViewCell.self, forCellWithReuseIdentifier: MultistageCollectionViewCell.reusebleID)
        self.collectionView.register(MultistageHeaderReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MultistageHeaderReusableView.reusebleID)
        
        // Configure Collection
        self.collectionView.showsVerticalScrollIndicator = false
        collectionView.allowsMultipleSelection = false

    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        questions.forEach { mod in
            mod.resetViews()
        }
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {

        return questions.count * 10

    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MultistageCollectionViewCell.reusebleID, for: indexPath) as! MultistageCollectionViewCell
        cell.configure(model: questions[indexPath.section % questions.count])

        animationCell(cell, index: nil, withReload: false)

        cell.didTaped = { [weak self] id in
            guard let self = self else { return }
            let cellId = indexPath.section % self.questions.count
            if self.questions[cellId].isAnswered { return }
            self.questions[cellId].answers[id!].isTaped = true
            self.questions[cellId].isAnswered = true
            self.questions[cellId].answers[id!].countEnter += 1
            self.questions[cellId].getPercents()

            self.animationCell(cell, index: indexPath, withReload: true)

        }

        return cell
    }

    // MARK: UICollectionViewDelegate

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset = UIEdgeInsets(top: 5, left: 8, bottom: 5, right: 8)
        return inset
    }

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MultistageHeaderReusableView.reusebleID, for: indexPath) as! MultistageHeaderReusableView
        header.configure(question: questions[indexPath.section % questions.count].question)

        return header
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.bounds.width, height: 50)
    }

    //MARK: - Private methods

    fileprivate func animationCell(_ cell: MultistageCollectionViewCell, index: IndexPath?, withReload: Bool) {
        cell.layer.transform = CATransform3DMakeScale(0.2,0.2,1)

        UIView.animate(withDuration: 0.4, animations: {
            cell.layer.transform = CATransform3DMakeScale(1.00,1.00,1)
        },completion: { finished in

            guard let index else { return }
            withReload ? self.collectionView.reloadItems(at: [index]) : nil
        })
    }

    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        var offset = collectionView.contentOffset
        let height = collectionView.contentSize.height
        if offset.y < height/4 {
            offset.y += height/2
            collectionView.setContentOffset(offset, animated: false)
        } else if offset.y > height/4 * 3 {
            offset.y -= height/2
            collectionView.setContentOffset(offset, animated: false)
        }
    }

    override func viewDidLayoutSubviews() {
          super.viewDidLayoutSubviews()
        self.collectionView.scrollToItem(at: IndexPath(item: 0, section: 10), at: .left, animated: true)
        }

}
