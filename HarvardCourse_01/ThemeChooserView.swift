//
//  ThemeChooserView.swift
//  HarvardCourse_01
//
//  Created by Егор Пехота on 01.06.2021.
//

import SwiftUI

struct ThemeChooserView: View {
    var themes: [Theme]

    var body: some View {
        NavigationView {
            List {
                ForEach(themes) { theme in
                    NavigationLink(destination: EmojiMemoryGameView(viewModel: EmojiMemoryGame(with: theme))
                                    .navigationBarTitleDisplayMode(NavigationBarItem.TitleDisplayMode.inline)
                    ) {
                        VStack(alignment: .leading) {
                            Text("\(theme.name)")
                                .font(Font.title)
                                .foregroundColor(Color(theme.color))
                            HStack {
                                Text("\(theme.numberOfPairsOfCards) pairs of \(theme.emojis.joined())")
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Memorize")
        }
    }
}