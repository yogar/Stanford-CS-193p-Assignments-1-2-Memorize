//
//  ThemeEditor.swift
//  Memorize
//
//  Created by Егор Пехота on 03.06.2021.
//

import SwiftUI

struct ThemeEditor: View {
    @EnvironmentObject var themeStore: ThemesStore
    @Binding var isShowing: Bool
    @Binding var theme: Theme
    @State var emojisToAdd: String = ""

    var body: some View {
        VStack(spacing: 0) {
            header
            Form {
                Section(header: Text("Theme name")) {
                    nameEditor
                }
                Section(header: Text("Add emoji")) {
                    emojiInput
                }
                Section(header: Text("Emojis")) {
                    emojis
                }
                Section (header: Text("Card count")) {
                    EmptyView()
                }
                Section (header: Text("Color")) {
                    EmptyView()
                }
            }
        }
    }
    
    var header: some View {
        VStack {
            ZStack {
                Text("Theme Editor")
                    .font(.headline)
                    .padding()
                HStack {
                    Spacer()
                    Button(action:{
                        isShowing = false
                    },
                    label: { Text("Done") })
                        .padding()
                }
            }
            Divider()
        }
    }
    
    var nameEditor: some View {
        TextField("Theme Name",text: $theme.name, onEditingChanged: { isEditing in
            if !isEditing {
                themeStore.rename(theme, with: theme.name)
            }
        })
    }
    
    var emojiInput: some View {
        HStack {
            TextField("Emoji",text: $emojisToAdd, onEditingChanged: { isEditing in
                if !isEditing {
//                    let emojisToAddArray = emojisToAdd.map { String($0)}
                    if self.emojisToAdd != ""   {
                        themeStore.addEmoji(emojisToAdd, to: theme)
                        emojisToAdd = ""
                    }
                }
            })
            Button("Add") {
                if emojisToAdd != "" {
                    themeStore.addEmoji(self.emojisToAdd, to: theme)
                    emojisToAdd = ""
                }
            }
            .disabled(emojisToAdd == "")
        }
    }
    
    var emojis: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 40, maximum: 350), spacing: 5)]) {
            ForEach(theme.emojis, id:\.self) { emoji in
                Text(emoji).font(.system(size: 30))
                    .onTapGesture {
                        themeStore.removeEmoji(emoji, to: theme)
                    }
            }
        }
    }
}


//                    Grid(emojis.map { String($0) }, id: \.self) { emoji in
//                        Text(emoji)
//                            .onTapGesture {
//                                themeChooser.removeEmoji(theme, emojiToRemove: emoji)
//                            }
//                        }
