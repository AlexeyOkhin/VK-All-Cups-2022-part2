//
//  MultistageController.swift
//  VK AllCups 2022 part2
//
//  Created by Djinsolobzik on 06.01.2023.
//

import UIKit

class MultistageController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var questions = QuestionsModel.sampleData

    override func viewDidLoad() {
        super.viewDidLoad()

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = CGSize(width: 300, height: 500)
        //self.collectionView.collectionViewLayout = createLayout()

        // Register cell classes
        self.collectionView!.register(MultistageCollectionViewCell.self, forCellWithReuseIdentifier: MultistageCollectionViewCell.reusebleID)
        self.collectionView.register(MultistageHeaderReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MultistageHeaderReusableView.reusebleID)

        self.collectionView.collectionViewLayout = createLayout()
        
        // Configure Collection
        self.collectionView.showsVerticalScrollIndicator = false
        collectionView.allowsMultipleSelection = false

    }

    private func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(1.0))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 5, leading: 0, bottom: 5, trailing: 0)

        section.boundarySupplementaryItems = [makeHeaderSupplementaryItem(elementKind: UICollectionView.elementKindSectionHeader)]
        let layout = UICollectionViewCompositionalLayout(section: section)

        return layout
    }

    private func makeHeaderSupplementaryItem(elementKind: String) -> NSCollectionLayoutBoundarySupplementaryItem {
        let size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50))
        let item = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: size, elementKind: elementKind, alignment: .topLeading)
        return item
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MultistageCollectionViewCell.reusebleID, for: indexPath) as! MultistageCollectionViewCell
        cell.configure(model: questions[indexPath.section % questions.count])

        cell.didTaped = { [weak self] id in
            guard let self = self else { return }
            let cellId = indexPath.section % self.questions.count
            if self.questions[cellId].isAnswered { return }
            self.questions[cellId].answers[id!].isTaped = true
            self.questions[cellId].isAnswered = true
            self.questions[cellId].answers[id!].countEnter += 1
            self.questions[cellId].getPercents()
            
            collectionView.reloadItems(at: [indexPath])
        }

        return cell
    }

    // MARK: UICollectionViewDelegate

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 350, height: 150)
//    }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        let inset = UIEdgeInsets(top: 5, left: 8, bottom: 5, right: 8)
//        return inset
//    }

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MultistageHeaderReusableView.reusebleID, for: indexPath) as! MultistageHeaderReusableView
        header.configure(question: questions[indexPath.section % questions.count].question)

        return header
    }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return CGSize(width: view.bounds.width, height: 60)
//    }


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
