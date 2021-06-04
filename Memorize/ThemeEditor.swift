//
//  ThemeEditor.swift
//  Memorize
//
//  Created by Егор Пехота on 03.06.2021.
//

import SwiftUI

struct ThemeEditor: View {
    @EnvironmentObject var themeChooser: ThemeChooser
    @Binding var isShowing: Bool
    @State var themeName: String = ""
    
    var body: some View {
        VStack(spacing: 0) {
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
            Form {
                Section {
//                    TextField("Theme Name",text: $themeName, onEditingChanged: { began in
//                        if !began {
//                            themeChooser.
//                        }
//                    })
                }
                Section {
                    EmptyView()
                }
                Section {
                    EmptyView()
                }
                Section {
                    EmptyView()
                }
                Section {
                    EmptyView()
                }
            }
        }
    }
}
