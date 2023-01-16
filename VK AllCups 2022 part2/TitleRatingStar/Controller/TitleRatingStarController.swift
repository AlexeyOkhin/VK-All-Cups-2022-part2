//
//  TitleRatingStarController.swift
//  VK AllCups 2022 part2
//
//  Created by Djinsolobzik on 12.01.2023.
//

import UIKit

class TitleRatingStarController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var dataTitles = TitleRatingStarModel.sempleData

    override func viewDidLoad() {
        super.viewDidLoad()

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = CGSize(width: 350, height: 500)
        self.collectionView.collectionViewLayout = layout

        // Register cell classes
        self.collectionView!.register(TitleRatingStarCell.self, forCellWithReuseIdentifier: TitleRatingStarCell.reusebleID)

        // Configure Collection
        self.collectionView.showsVerticalScrollIndicator = false
        collectionView.allowsMultipleSelection = false

    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return dataTitles.count * 10
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleRatingStarCell.reusebleID, for: indexPath) as? TitleRatingStarCell
        
        cell?.configure(model: dataTitles[indexPath.row % dataTitles.count])
        return cell ?? UICollectionViewCell()
    }

    //MARK: - UICollectionViewControllerDelegate

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        return inset
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
        self.collectionView.scrollToItem(at: IndexPath(item: 10, section: 0), at: .left, animated: true)
        }

}
