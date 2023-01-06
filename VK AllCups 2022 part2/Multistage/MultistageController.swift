//
//  MultistageController.swift
//  VK AllCups 2022 part2
//
//  Created by Djinsolobzik on 06.01.2023.
//

import UIKit

class MultistageController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let questions = QuestionsModel.sampleData

    override func viewDidLoad() {
        super.viewDidLoad()

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        self.collectionView.collectionViewLayout = layout

        // Register cell classes
        self.collectionView!.register(MultistageCollectionViewCell.self, forCellWithReuseIdentifier: MultistageCollectionViewCell.reusebleID)
        self.collectionView.register(MultistageHeaderReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MultistageHeaderReusableView.reusebleID)

        self.collectionView.showsVerticalScrollIndicator = false

    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {

        return questions.count * 10
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return questions[section % questions.count].answers.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MultistageCollectionViewCell.reusebleID, for: indexPath)

        cell.backgroundColor = .lightGray

        return cell
    }

    // MARK: UICollectionViewDelegate

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 50)
    }

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
        return CGSize(width: view.bounds.width, height: 80)
    }

//    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//            let pageFloat = (scrollView.contentOffset.x / scrollView.frame.size.width)
//            let pageInt = Int(round(pageFloat))
//
//            switch pageInt {
//            case 0:
//                collectionView.scrollToItem(at: [0, 3], at: .left, animated: false)
//            case questions.count - 1:
//                collectionView.scrollToItem(at: [0, 1], at: .left, animated: false)
//            default:
//                break
//            }
//        }

//    func scrollToMiddle(atIndex: Int, animated: Bool = false) {
//        let middleIndex = atIndex + 1000
//        collectionView.scrollToItem(at: IndexPath(item: 1, section: 1000), at: .centeredVertically, animated: false)
//    }

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

//    override func viewDidLayoutSubviews() {
//          super.viewDidLayoutSubviews()
//        self.collectionView.scrollToItem(at: IndexPath(item: 1, section: 20), at: .left, animated: true)
//        }

}
