//
//  EmojiMemoryGame.swift
//  HarvardCourse_01
//
//  Created by Egor Pekhota on 28.02.2021.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame(with: selectedTheme)
    // @Published — property wrapper, calls objectWillChange() every time when model changes
    
    static var themes: Set<Theme> = [
        Theme(name: "Food",emojis: ["🍛","🌭","🍤","🍜"], numberOfPairsOfCards: 4, color: "orange"),
        Theme(name: "Emotions",emojis: ["😛","😘","😒","😫","😡","🤔"], numberOfPairsOfCards: nil, color: "yellow"),
        Theme(name: "Buildings",emojis: ["🏢","🏦","🏛","⛩","🕍","🏠"], numberOfPairsOfCards: 6, color: "gray"),
        Theme(name: "Symbols",emojis: ["⚪️","🔳","▪️","🔶","🔘","👁‍🗨"], numberOfPairsOfCards: 6, color: "pink"),
        Theme(name: "Animals",emojis: ["🐯","🐸","🐺","🦎","🐁","🐙"], numberOfPairsOfCards: 6, color: "red"),
        Theme(name: "Flags",emojis: ["🇦🇹","🇧🇾","🇦🇼","🇭🇳","🇯🇲","🇭🇰"], numberOfPairsOfCards: nil, color: "indigo")
        ]
    
    static func selectTheme() -> Theme {
        return themes.randomElement()!
    }
    
    static var selectedTheme = selectTheme()
    
    // A struct for game theme concept
    struct Theme: Hashable {
        let name: String
        let emojis: Array<String>
        let numberOfPairsOfCards: Int?
        let color: String
    }
    
    private static func createMemoryGame(with theme: Theme) -> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairsOfCards ?? Int.random(in: 2...6)) {pairIndex in
            return theme.emojis[pairIndex]
        }
    }

    // MARK: Access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    var score: Int {
        return model.score
    }
    
    // MARK: Intent(s)
    func choose(card: MemoryGame<String>.Card) {
        return model.choose(card: card)
    }
    
    func resetGame() {
        EmojiMemoryGame.selectedTheme = EmojiMemoryGame.selectTheme()
        model = EmojiMemoryGame.createMemoryGame(with: EmojiMemoryGame.selectedTheme)
    }
}
