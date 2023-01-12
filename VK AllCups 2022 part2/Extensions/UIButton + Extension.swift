//
//  UIButton + Extension.swift
//  VK AllCups 2022 part2
//
//  Created by Djinsolobzik on 08.01.2023.
//

import UIKit

extension UIButton {

    convenience init(
        title: String,
        backgroundCollor: UIColor = .white,
        titleColor: UIColor = .black,
        font: UIFont? = .systemFont(ofSize: 18),
        cornerRadius: CGFloat = 16,
        isBorder: Bool = true)
    {

        self.init(type: .system)
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundCollor
        self.titleLabel?.font = font

        self.layer.cornerRadius = cornerRadius

        if isBorder {
            self.layer.borderColor = UIColor.black.cgColor
            self.layer.borderWidth = 1
        }
    }


}
