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
    @State private var selectedIndex: Int = 0
    
    var body: some View {
        NavigationView {
            List {
                ForEach(themeChooser.themes.indices, id: \.self) {index in
                        NavigationLink(destination:
                                        EmojiMemoryGameView(viewModel: EmojiMemoryGame(with: themeChooser.themes[index]))
                                            .navigationBarTitleDisplayMode(NavigationBarItem.TitleDisplayMode.inline)) {
                            HStack{
                                if editMode == .active {
                                    Image(systemName: "pencil.circle.fill")
                                        .imageScale(.large)
                                        .foregroundColor(Color(themeChooser.themes[index].color))
                                        .padding()
                                        .onTapGesture {
                                            selectedIndex = index
                                            showThemeEditor = true
                                        }
                                }
                                VStack(alignment: .leading) {
                                    Text("\(themeChooser.themes[index].name)")
                                        .font(Font.title)
                                        .foregroundColor(Color(themeChooser.themes[index].color))
                                    HStack {
                                        Text("\(themeChooser.themes[index].numberOfPairsOfCards) pairs of \(themeChooser.themes[index].emojis.joined())")
                                    }
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
            .sheet(isPresented: $showThemeEditor, onDismiss: {editMode = .inactive}) {
                ThemeEditor(isShowing: $showThemeEditor, theme: $themeChooser.themes[selectedIndex])
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
