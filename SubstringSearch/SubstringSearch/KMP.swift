//
//  KMP.swift
//  SubstringSearch
//
//  Created by Agamenon Rocha Dos Santos on 12/07/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import Foundation

func searchKMP(text: String, pattern: String)-> [Int] {
    var t: Int = 0
    var p: Int = 0
    
    let tLen: Int = text.count;
    let pLen = pattern.count
    
    var matches: [Int] = []
    let prefixLen = calcPrefixLen(pattern: pattern)
    
    while t < tLen {
        if pattern[p] == text[t] {
            p += 1
            t += 1
            if p == pLen {
                matches.append(t - p)
                p = prefixLen[p]
            }
        }else {
            p = prefixLen[p]
            if p < 0 {
                t += 1
                p += 1
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
            ar[i] = 0
        }
    }
    return ar
    
}
