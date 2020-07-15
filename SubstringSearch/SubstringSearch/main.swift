//
//  main.swift
//  SubstringSearch
//
//  Created by Agamenon Rocha Dos Santos on 12/07/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import Foundation

//print(calcPrefixLen(pattern: "abcdeabab"))

let pattern = "abcab"
let text = "abdabcabxx"
print(searchKMP(text: text, pattern: pattern))
//print(pattern.hashValue)
//print(searchRabinKarp(text: text, pattern: pattern))
