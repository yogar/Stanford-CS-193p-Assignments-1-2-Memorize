//
//  ThemeChooserView.swift
//  HarvardCourse_01
//
//  Created by Егор Пехота on 01.06.2021.
//

import SwiftUI

struct ThemeChooserView: View {
    @EnvironmentObject var themeChooser: ThemeChooser
    
    @State private var editMode: EditMode = .inactive
    @State private var showThemeEditor = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(themeChooser.themes) { theme in
                    NavigationLink(destination:
                                    EmojiMemoryGameView(viewModel: EmojiMemoryGame(with: theme))
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
                .onDelete { indexSet in
                    indexSet.map { themeChooser.themes[$0] }.forEach { theme in
                        themeChooser.removeTheme(theme: theme)
                    }
                }
            }
            .navigationBarTitle("Memorize")
            .navigationBarItems(
                leading:
                    Button(action: {
                        themeChooser.addTheme()
                    }, label: {
                        Image(systemName: "plus")
                            .imageScale(.large)
                        }
                    )
                ,
                trailing:
                    EditButton()
            )
            .environment(\.editMode, $editMode)
        }
    }
}

//.popover(isPresented: $showThemeEditor) {
//        ThemeEditor(isShowing: $showThemeEditor)
//            .environmentObject(themeChooser)
