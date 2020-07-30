//
//  GasStation.swift
//  GreedyAlgorithmAssignment
//
//  Created by Agamenon Rocha Dos Santos on 29/07/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import Foundation

func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
    var diffs = [Int](repeating: 0, count: gas.count)
    
    for i in 0..<gas.count {
        let result = gas[i] - cost[i]
        diffs[i] = result
    }
    var index = -1
    for i in 0..<gas.count{
        
        var sum = 0
        for j in i..<gas.count * 2 - 1 {
            sum += diffs[j %  gas.count]
            if sum < 0 {
                break
            }
        }
        if sum >= 0{
            index = i
            break
        }
        print(diffs)
    }
    //print(totalCost)
    return index;
}
