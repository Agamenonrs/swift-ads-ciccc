//
//  WhoIsMyParent.swift
//  TreeQuiz
//
//  Created by Agamenon Rocha Dos Santos on 20/07/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import Foundation


/*
 input
7
1 6
6 3
3 5
4 1
2 4
4 7
 
 */
func whoIsMyParent() {
    let n = Int(readLine()!)!
   
    var nodes = [Int](repeating: 0, count: n + 1)
    var hasParent = [Bool](repeating: false, count: n)
    hasParent[0] = true
    
    for _ in 0..<n-1 {
        let edge = readLine()!.split(separator: " ")
        
        let u = Int(edge[0])!
        let v = Int(edge[1])!
        
        if hasParent[u-1] {
            nodes[v] = u
            hasParent[v-1] = true
        } else {
            nodes[u] = v
            hasParent[u-1] = true
        }
    }

    for index in 2...n {
        
        print(nodes[index])
        
    }
}
