//
//  ThemeChooserView.swift
//  HarvardCourse_01
//
//  Created by Егор Пехота on 01.06.2021.
//

import SwiftUI

struct ThemeChooserView: View {
    @EnvironmentObject var themeStore: ThemesStore
    @State private var editMode: EditMode = .inactive
    @State private var showThemeEditor = false
    @State private var selectedIndex: Int = 0
    
    var body: some View {
        NavigationView {
            List {
                ForEach(themeStore.themes.indices, id: \.self) {index in
                        NavigationLink(destination:
                                        EmojiMemoryGameView(viewModel: EmojiMemoryGame(with: themeStore.themes[index]))
                                            .navigationBarTitleDisplayMode(NavigationBarItem.TitleDisplayMode.inline)) {
                            HStack{
                                if editMode == .active {
                                    Image(systemName: "pencil.circle.fill")
                                        .imageScale(.large)
                                        .foregroundColor(Color(themeStore.themes[index].color))
                                        .padding()
                                        .onTapGesture {
                                            selectedIndex = index
                                            showThemeEditor = true
                                        }
                                }
                                VStack(alignment: .leading) {
                                    Text("\(themeStore.themes[index].name)")
                                        .font(Font.title)
                                        .foregroundColor(Color(themeStore.themes[index].color))
                                    HStack {
                                        Text("\(themeStore.themes[index].numberOfPairsOfCards) pairs of \(themeStore.themes[index].emojis.joined())")
                                    }
                                }
                            }
                        }
                }
                .onDelete { indexSet in
                    indexSet.map { themeStore.themes[$0] }.forEach { theme in
                        themeStore.removeTheme(theme: theme)
                    }
                }
            }
            .sheet(isPresented: $showThemeEditor, onDismiss: {editMode = .inactive}) {
                ThemeEditor(isShowing: $showThemeEditor, theme: $themeStore.themes[selectedIndex])
            }
            .navigationBarTitle("Memorize")
            .navigationBarItems(
                leading:
                    Button(action: {
                        themeStore.addTheme()
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
