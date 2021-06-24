//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Егор Пехота on 03.06.2021.
//

import SwiftUI

@main
struct MomrizeApp: App {
    let themesStore = ThemesStore()
    var body: some Scene {
        WindowGroup {
            ThemeChooser().environmentObject(themesStore)
        }
    }
}
