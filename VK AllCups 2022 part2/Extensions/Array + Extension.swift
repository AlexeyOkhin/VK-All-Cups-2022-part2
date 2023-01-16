//
//  Array + Extension.swift
//  VK AllCups 2022 part2
//
//  Created by Djinsolobzik on 15.01.2023.
//

import Foundation

extension Array {

    public mutating func forEachInout(_ body: (inout Element) throws -> Void) rethrows {
        for i in 0..<count {
            try body(&self[i])
        }
    }
}
