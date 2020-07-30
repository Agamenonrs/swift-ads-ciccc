//
//  TaskScheduler.swift
//  TreeAndGraph
//
//  Created by Agamenon Rocha Dos Santos on 29/07/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import Foundation

func leastInterval( _ tasks: [Character], _ n: Int) -> Int {
    var frequencies = [Int](repeating: 0, count: 26)
    var maxCount = 0
    var maxFreq = 0
    
    for task in tasks {
        let i = Int(task.asciiValue!) - 65
        frequencies[i] += 1
    }
    
    for freq in frequencies {
        if freq == 0 { continue }
        if maxFreq < freq {
            maxFreq = freq
        }else if maxFreq == freq {
            maxFreq += 1
        }
    }
    
    let placeHolderLength = ( n + 1 ) * ( maxFreq - 1 ) + maxCount
    return tasks.count > placeHolderLength ? tasks.count : placeHolderLength
}





