//
//  Palidrome.swift
//  iOSPracticeProblems
//
//  Created by Sonja Olson on 12/1/18.
//  Copyright © 2018 Sonja Olson. All rights reserved.
//

import Foundation

func isPalindrome(word: String) -> Bool {
    let word = word.lowercased().filter { $0 != " " }
    return word == String(word.reversed())
}
