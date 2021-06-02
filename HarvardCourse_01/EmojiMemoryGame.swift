//
//  EmojiMemoryGame.swift
//  HarvardCourse_01
//
//  Created by Egor Pekhota on 28.02.2021.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
    @Published private var memoryGame: MemoryGame<String>
    var theme: Theme
    
    init(with theme: Theme) {
        self.theme = theme
        let encoder = JSONEncoder()
        let data = try? encoder.encode(theme)
        if let data = data {
            print(String(data: data, encoding: .utf8)!)
        }
        memoryGame = MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairsOfCards) {pairIndex in
            return theme.emojis[pairIndex]
        }
    }

    // MARK: Access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        return memoryGame.cards
    }
    
    var score: Int {
        return memoryGame.score
    }
    
    // MARK: Intent(s)
    func choose(card: MemoryGame<String>.Card) {
        return memoryGame.choose(card: card)
    }
    
    func resetGame() {
        memoryGame = MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairsOfCards) {pairIndex in
            theme.emojis[pairIndex]
        }
    }
}
