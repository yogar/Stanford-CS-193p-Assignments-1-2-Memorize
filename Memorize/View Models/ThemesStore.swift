//
//  ThemesStore.swift
//  HarvardCourse_01
//
//  Created by Егор Пехота on 01.06.2021.
//

import Foundation
import Combine

class ThemesStore: ObservableObject {
    private var autosaveCancellable: AnyCancellable?
    @Published var themes: Array<Theme> = []
    
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
//        self.themes.append(Theme(name: "Food",emojis: ["🍛","🌭","🍤","🍜"], numberOfPairsOfCards: 4, color: "orange"))
        autosaveCancellable = $themes.sink { themes in
            let themesJson = try? JSONEncoder().encode(themes)
            UserDefaults.standard.set(themesJson, forKey: defaultsKey)
        }
    }
    
    func removeTheme(theme: Theme) {
        if let index = themes.firstIndex(matching: theme){
            themes.remove(at: index)
        }
    }
    
    func addTheme() {
        themes.append(Theme.init())
    }
    
    func rename(_ theme: Theme, with name: String) {
        if let index = themes.firstIndex(matching: theme){
            themes[index].name = name
        }
    }
    
    func addEmoji(_ emojisToAdd: String, to theme: Theme) {
        if let index = themes.firstIndex(matching: theme) {
            themes[index].emojis.append(contentsOf: (emojisToAdd.map { String($0) }))
            var uniqueEmojis = Array<String>()
            for emoji in themes[index].emojis {
                if !uniqueEmojis.contains(emoji) {
                    uniqueEmojis.append(emoji)
                }
            }
            themes[index].emojis = uniqueEmojis
        }
    }
    
    func removeEmoji(_ emojiToRemove: String,from theme: Theme) {
        guard theme.emojis.count > theme.numberOfPairsOfCards else { return }
        
        if let themeIndex = themes.firstIndex(matching: theme){
            if let emojiIndex = themes[themeIndex].emojis.firstIndex(of: emojiToRemove) {
                themes[themeIndex].emojis.remove(at: emojiIndex)
            }
        }
    }
}


//                        themes.append(Theme(name: "Food",emojis: ["🍛","🌭","🍤","🍜"], numberOfPairsOfCards: 4, color: "orange"))
//                        themes.append(Theme(name: "Emotions",emojis: ["😛","😘","😒","😫","😡","🤔"], numberOfPairsOfCards: 5, color: "yellow"))
//                        themes.append(Theme(name: "Buildings",emojis: ["🏢","🏦","🏛","⛩","🕍","🏠"], numberOfPairsOfCards: 6, color: "gray"))
//                        themes.append(Theme(name: "Symbols",emojis: ["⚪️","🔳","▪️","🔶","🔘","👁‍🗨"], numberOfPairsOfCards: 5, color: "pink"))
//                        themes.append(Theme(name: "Animals",emojis: ["🐯","🐸","🐺","🦎","🐁","🐙"], numberOfPairsOfCards: 6, color: "red"))
//                        themes.append(Theme(name: "Flags",emojis: ["🇦🇹","🇧🇾","🇦🇼","🇭🇳","🇯🇲","🇭🇰"], numberOfPairsOfCards: 5, color: "indigo"))
