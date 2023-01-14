//
//  DraggingController.swift
//  VK AllCups 2022 part2
//
//  Created by Djinsolobzik on 14.01.2023.
//

import UIKit

class DraggingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var draggingsData = DraggingModel.makeModels

    override func viewDidLoad() {
        super.viewDidLoad()

        let layout = LeftAlignmentFlowLayout()
        layout.estimatedItemSize = LeftAlignmentFlowLayout.automaticSize
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 8
        layout.footerReferenceSize = CGSize(width: 100, height: 100)

//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .vertical
//        layout.estimatedItemSize = CGSize(width: 350, height: 500)
        self.collectionView.collectionViewLayout = layout

        // Configure Collection
        self.collectionView.showsVerticalScrollIndicator = false
        collectionView.allowsMultipleSelection = false

        self.collectionView!.register(DraggingCell.self, forCellWithReuseIdentifier: DraggingCell.reuseID)
        self.collectionView.register(FooterAnswerCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterAnswerCell.identifireID)

    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {

        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(draggingsData[section].arrayQuestionText.count)
        return draggingsData[section].arrayQuestionText.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DraggingCell.reuseID, for: indexPath) as? DraggingCell
    
        cell?.configureCell(model: draggingsData[indexPath.section])
    
        return cell ?? UICollectionViewCell()
    }

    // MARK: UICollectionViewDelegate

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        return inset
    }

    override func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {

        guard let foooterView = collectionView.dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: FooterAnswerCell.identifireID,
            for: indexPath) as? FooterAnswerCell
        else { return UICollectionViewCell() }

        return foooterView
    }

}
