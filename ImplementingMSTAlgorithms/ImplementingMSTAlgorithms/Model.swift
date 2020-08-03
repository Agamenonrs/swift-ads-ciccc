//
//  Model.swift
//  ImplementingMSTAlgorithms
//
//  Created by Agamenon Rocha Dos Santos on 31/07/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import Foundation

struct Graph {
    let src: Int
    let dest: Int
    let weight: Int
}

extension Graph: Comparable, Hashable {
    
    static func < (lhs: Graph, rhs: Graph) -> Bool {
        return lhs.weight < rhs.weight
    }
    static func == (lhs: Graph, rhs: Graph) -> Bool {
        return lhs.weight == rhs.weight
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(weight)
    }
}
