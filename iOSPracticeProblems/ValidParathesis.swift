//
//  ValidParathesis.swift
//  iOSPracticeProblems
//
//  Created by Sonja Olson on 12/1/18.
//  Copyright © 2018 Sonja Olson. All rights reserved.
//

import Foundation

private extension String {
    func randomAccessCharacterArray() -> Array<Character> {
        return Array(self)
    }
}

struct validParentheses {

    static func isValid(_ s: String) -> Bool {
        let charArr = s.randomAccessCharacterArray()
        let dict: Dictionary<Character, Character> = [
            "}":"{",
            "]":"[",
            ")":"("
        ]
        var stack: Array<Character> = []
        for char in charArr {
            if char == "}" || char == ")" || char == "]" {
                if stack.isEmpty || stack.last != dict[char] {
                    return false
                } else {
                    stack.removeLast()
                }
            } else {
                stack.append(char)
            }
        }
        return stack.isEmpty
    }
}

