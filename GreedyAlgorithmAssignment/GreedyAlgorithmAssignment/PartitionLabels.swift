//
//  PartitionLabels.swift
//  GreedyAlgorithmAssignment
//
//  Created by Agamenon Rocha Dos Santos on 29/07/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import Foundation

/*
1             7           13 14  15
a b a b c a c a d e f e g d  e   h  i j h k l i j
*/

func partitionLabels(_ S: String) -> [Int] {

    let characters = Array(S)
    var map = [Int](repeating: -1, count: characters.count)
    // ababcbacadefegdehijhklij
    for i in 0..<characters.count {
        
        let position = characters.lastIndex(of: characters[i])!
        if !map.contains(position){
            map[i] = characters.lastIndex(of: characters[i])!
        }
        
    }
    
    var result: [Int] = []
    var i = 0
    while i < map.count{
        let begin = i
        var end = map[i]
        var j = begin + 1
        
        while j < end {
            if map[j] + 1 == -1{
                j += 1
                continue
            }
            if map[j] > end{
                end = map[j]
            }
            j += 1
        }
        //print("begin \(begin) end \(end) ")
        result.append(end - begin + 1)
        i = end + 1
    }
    
    /*
     0  1   2   3  4   5   6   7   8  9  10  11  12  13  14  15  16  17  18  19  20  21  22  23  24
    [8, 5, -1, -1, 7, -1, -1, -1, -1, 9, 15, 16, 12, -1, 14, -1, -1, 20, 23, 24, -1, 21, 22, -1, -1]
    */
    //print(map)
     
    return result
}
