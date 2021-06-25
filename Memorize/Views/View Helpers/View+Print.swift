//
//  View+Print.swift
//  HarvardCourse_01
//
//  Created by Егор Пехота on 20.03.2021.
//

import SwiftUI

extension View {
    func Print(_ vars: Any...) -> some View {
        for v in vars {print (v)}
        return EmptyView()
    }
}
