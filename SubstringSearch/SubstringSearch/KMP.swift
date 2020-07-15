//
//  KMP.swift
//  SubstringSearch
//
//  Created by Agamenon Rocha Dos Santos on 12/07/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import Foundation

func searchKMP(text: String, pattern: String)-> [Int] {
    var textCurrentPosition: Int = 0
    var patternCurrentPosition: Int = 0
    
    let textLen: Int = text.count;
    let patternLen = pattern.count
    
    var matches: [Int] = []
    let arrayPrefix = calcPrefixLen(pattern: pattern)
    
     while textCurrentPosition < textLen {
        if pattern[patternCurrentPosition] == text[textCurrentPosition] {
            patternCurrentPosition += 1
            textCurrentPosition += 1
            if patternCurrentPosition == patternLen {
                matches.append(textCurrentPosition - patternCurrentPosition)
                patternCurrentPosition = arrayPrefix[patternCurrentPosition]
            }
        }else {
            patternCurrentPosition = arrayPrefix[patternCurrentPosition]
            if patternCurrentPosition < 0 {
                textCurrentPosition += 1
                patternCurrentPosition += 1
            }
        }
    }
    return matches
}

func calcPrefixLen(pattern: String)-> [Int]{
    let patternLen: Int = pattern.count
    var ar = Array<Int>(repeating: 0, count: patternLen + 1)
    ar[0] = -1
    //print(ar)
    
    var prefixLen = 0;
    var i = 1
    
    while i < patternLen {
        if pattern[prefixLen] == pattern[i] {
            prefixLen += 1
            i += 1
            ar[i] = prefixLen
        }else if prefixLen > 0 {
            prefixLen = ar[prefixLen]
        }else {
            i += 1
            //ar[i] = 0
        }
    }
    return ar
    
}
