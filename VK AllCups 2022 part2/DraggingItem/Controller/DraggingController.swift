//
//  DraggingController.swift
//  VK AllCups 2022 part2
//
//  Created by Djinsolobzik on 14.01.2023.
//

import UIKit

class DraggingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var draggingsData = DraggingModel.makeModels
    var frameCell: CGRect?

    override func viewDidLoad() {
        super.viewDidLoad()

        let layout = LeftAlignmentFlowLayout()
        layout.estimatedItemSize = LeftAlignmentFlowLayout.automaticSize
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 8
        layout.footerReferenceSize = CGSize(width: 100, height: 80)

        self.collectionView.collectionViewLayout = layout

        collectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)

        // Configure Collection
        self.collectionView.showsVerticalScrollIndicator = false
        collectionView.allowsMultipleSelection = false

        self.collectionView!.register(DraggingCell.self, forCellWithReuseIdentifier: DraggingCell.reuseID)
        self.collectionView.register(FooterAnswerCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterAnswerCell.identifireID)
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {

        return draggingsData.count * 10
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return draggingsData[section % draggingsData.count].arrayQuestionText.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DraggingCell.reuseID, for: indexPath) as? DraggingCell
    
        cell?.configure(model: draggingsData[indexPath.section % draggingsData.count].arrayQuestionText[indexPath.row])
        frameCell = cell?.frame

        return cell ?? UICollectionViewCell()
    }

    override func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {

        guard let foooterView = collectionView.dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: FooterAnswerCell.identifireID,
            for: indexPath) as? FooterAnswerCell
        else { return UICollectionViewCell() }

        foooterView.configureFooter(arrayAnswer: draggingsData[indexPath.section % draggingsData.count].answerWords, viewForMove: collectionView, cellFrame: frameCell!)
  
        return foooterView
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
