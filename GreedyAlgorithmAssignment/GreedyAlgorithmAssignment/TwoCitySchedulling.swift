//
//  TwoCityScheduling.swift
//  TreeAndGraph
//
//  Created by Agamenon Rocha Dos Santos on 29/07/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import Foundation

func twoCitySchedCost(_ costs: [[Int]] )-> Int{
   /*
    let sumA = costs.reduce(0) { $0 + $1[0] }
    print(sumA)
 */
    var sumA = 0
    var diffs = [Int]()
    for cost in costs {
        sumA += cost[0]
        diffs.append(cost[1] - cost[0])
    }
    diffs.sort()
    for diff in diffs[0..<diffs.count / 2]{
        sumA += diff
    }
    return sumA
}
