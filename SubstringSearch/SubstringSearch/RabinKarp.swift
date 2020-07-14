//
//  RabinKarp.swift
//  SubstringSearch
//
//  Created by Agamenon Rocha Dos Santos on 14/07/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import Foundation

func searchRabinKarp(text: String , pattern: String) -> [Int] {
    var result: [Int] = []
    if text.count < pattern.count {
        return []
    }

    let patternHash = pattern.hashValue
    let patternLenth = pattern.count
    var endIdx = pattern.count - 1
    
    
    for idx in 0...(text.count - pattern.count) {
        endIdx = patternLenth + idx
        let window = text[idx,endIdx]
        if window.hashValue == patternHash {
            if window == pattern {
                result.append(idx)
            }
        }
    }
    return result
}
