//
//  Array+Identifiable.swift
//  MemoryGame
//
//  Created by 楢崎修二 on 2020/10/03.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}

