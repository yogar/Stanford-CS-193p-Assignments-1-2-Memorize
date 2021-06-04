//
//  ThemeChooser.swift
//  HarvardCourse_01
//
//  Created by Егор Пехота on 01.06.2021.
//

import Foundation
import Combine

class ThemeChooser: ObservableObject {
    private var autosaveCancellable: AnyCancellable?
    @Published private(set) var themes: Array<Theme> = []
    
    init() {
        let defaultsKey = "MemorizeThemes"
        let data = UserDefaults.standard.data(forKey: defaultsKey)
        if let data = data {
            if let themes = try? JSONDecoder().decode(Array<Theme>.self, from: data) {
                self.themes = themes
            } else {
            self.themes = []
            }
        } else {
            self.themes = []
        }
        autosaveCancellable = $themes.sink { themes in
            UserDefaults.standard.set(self.themesJson, forKey: defaultsKey)
        }
    }
    
    private var themesJson: Data? {
        return try? JSONEncoder().encode(themes)
    }
    
    func removeTheme(theme: Theme) {
        if let index = themes.firstIndex(matching: theme){
            themes.remove(at: index)
        }
    }
    
    func addTheme() {
        themes.append(Theme.init())
    }
}

struct Theme: Codable, Identifiable, Equatable {
    let id: UUID
    let name: String
    let emojis: Array<String>
    let numberOfPairsOfCards: Int
    let color: String
    
    init(id: UUID? = nil, name: String = "New Theme", emojis: Array<String> = ["😛","😘"], numberOfPairsOfCards: Int = 2, color: String = "red") {
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

//                        themes.append(Theme(name: "Food",emojis: ["🍛","🌭","🍤","🍜"], numberOfPairsOfCards: 4, color: "orange"))
//                        themes.append(Theme(name: "Emotions",emojis: ["😛","😘","😒","😫","😡","🤔"], numberOfPairsOfCards: 5, color: "yellow"))
//                        themes.append(Theme(name: "Buildings",emojis: ["🏢","🏦","🏛","⛩","🕍","🏠"], numberOfPairsOfCards: 6, color: "gray"))
//                        themes.append(Theme(name: "Symbols",emojis: ["⚪️","🔳","▪️","🔶","🔘","👁‍🗨"], numberOfPairsOfCards: 5, color: "pink"))
//                        themes.append(Theme(name: "Animals",emojis: ["🐯","🐸","🐺","🦎","🐁","🐙"], numberOfPairsOfCards: 6, color: "red"))
//                        themes.append(Theme(name: "Flags",emojis: ["🇦🇹","🇧🇾","🇦🇼","🇭🇳","🇯🇲","🇭🇰"], numberOfPairsOfCards: 5, color: "indigo"))
