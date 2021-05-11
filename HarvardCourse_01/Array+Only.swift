//
//  Array+Only.swift
//  HarvardCourse_01
//
//  Created by Егор Пехота on 11.03.2021.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
 }
