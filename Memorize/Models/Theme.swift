//
//  Theme.swift
//  Memorize
//
//  Created by Егор Пехота on 25.06.2021.
//

import Foundation

struct Theme: Codable, Identifiable, Equatable {
    let id: UUID
    var name: String
    var emojis: Array<String>
    var numberOfPairsOfCards: Int
    var color: String
    
    init(id: UUID? = nil, name: String = "New Theme", emojis: Array<String> = ["😛","😘"], numberOfPairsOfCards: Int = 2, color: String = "purple") {
        if let id = id {
            self.id = id
        } else {
            self.id = UUID()
        }
        self.name = name
        self.emojis = emojis
        self.numberOfPairsOfCards = numberOfPairsOfCards
        self.color = color
    }
}
