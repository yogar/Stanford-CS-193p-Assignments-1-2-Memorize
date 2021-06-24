//
//  ThemeChooser.swift
//  HarvardCourse_01
//
//  Created by Егор Пехота on 01.06.2021.
//

import SwiftUI

struct ThemeChooser: View {
    @EnvironmentObject var themesStore: ThemesStore
    @State private var editMode: EditMode = .inactive
    @State private var showThemeEditor = false
    @State private var selectedIndex: Int = 0
    
    var body: some View {
        NavigationView {
            List {
                ForEach(themesStore.themes.indices, id: \.self) {index in
                        NavigationLink(destination:
                                        EmojiMemoryGameView(viewModel: EmojiMemoryGame(with: themesStore.themes[index]))
                                            .navigationBarTitleDisplayMode(NavigationBarItem.TitleDisplayMode.inline)) {
                            HStack{
                                if editMode == .active {
                                    Image(systemName: "pencil.circle.fill")
                                        .imageScale(.large)
                                        .foregroundColor(Color(themesStore.themes[index].color))
                                        .padding()
                                        .onTapGesture {
                                            selectedIndex = index
                                            showThemeEditor = true
                                        }
                                }
                                VStack(alignment: .leading) {
                                    Text("\(themesStore.themes[index].name)")
                                        .font(Font.title)
                                        .foregroundColor(Color(themesStore.themes[index].color))
                                    HStack {
                                        Text("\(themesStore.themes[index].numberOfPairsOfCards) pairs of \(themesStore.themes[index].emojis.joined())")
                                    }
                                }
                            }
                        }
                }
                .onDelete { indexSet in
                    indexSet.map { themesStore.themes[$0] }.forEach { theme in
                        themesStore.removeTheme(theme: theme)
                    }
                }
            }
            .sheet(isPresented: $showThemeEditor, onDismiss: {editMode = .inactive}) {
                ThemeEditor(isShowing: $showThemeEditor, theme: $themesStore.themes[selectedIndex])
            }
            .navigationBarTitle("Memorize")
            .navigationBarItems(
                leading:
                    Button(action: {
                        themesStore.addTheme()
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
