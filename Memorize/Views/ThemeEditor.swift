//
//  ThemeEditor.swift
//  Memorize
//
//  Created by Егор Пехота on 03.06.2021.
//

import SwiftUI

struct ThemeEditor: View {
    @EnvironmentObject var themesStore: ThemesStore
    @Binding var isShowing: Bool
    @Binding var theme: Theme
    @State var emojisToAdd: String = ""
    
    private let colors: [Color] = [.orange, .red, .gray, .pink,
                           .yellow, .purple]

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
                    cardCount
                }
                Section (header: Text("Color")) {
                    themeColor
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
                themesStore.rename(theme, with: theme.name)
            }
        })
    }
    
    var emojiInput: some View {
        HStack {
            TextField("Emoji",text: $emojisToAdd, onEditingChanged: { isEditing in
                if !isEditing {
//                    let emojisToAddArray = emojisToAdd.map { String($0)}
                    if self.emojisToAdd != ""   {
                        themesStore.addEmoji(emojisToAdd, to: theme)
                        emojisToAdd = ""
                    }
                }
            })
            Button("Add") {
                if emojisToAdd != "" {
                    themesStore.addEmoji(self.emojisToAdd, to: theme)
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
                        print(emoji)
                        themesStore.removeEmoji(emoji, from: theme)
                    }
            }
        }
    }
    
    var cardCount: some View {
        Stepper(value: $theme.numberOfPairsOfCards, in: 2...theme.emojis.count, step: 1) {
            Text("\(theme.numberOfPairsOfCards)")
        }
    }
    
    
    var themeColor: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 50, maximum: 80), spacing: 5)]) {
            ForEach(colors, id: \.self) { value in
                ZStack {
                        Rectangle()
                            .fill(value)
                            .cornerRadius(5)
                            .aspectRatio(0.75, contentMode: .fit)
                            .onTapGesture {
                                theme.color = value.description
                            }
                        if theme.color == value.description {
                            Image(systemName: "checkmark.circle")
                                .foregroundColor(.white)
                        }
                }
            }
        }
        .padding([.vertical])
    }
    
}
