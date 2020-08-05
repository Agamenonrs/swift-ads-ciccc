//
//  MinimumCostFlowAssignment.swift
//  MinimumCostFlowAssignment
//
//  Created by Agamenon Rocha Dos Santos on 03/08/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import Foundation

/*
 
 4 4 0
 1 2 1
 2 3 2
 3 4 1
 4 1 1
 
 **/

func minimumCost(){
    let firstLine = readLine()!.split(separator: " ").map { Int( $0 )! }
    let n = firstLine[0]
    let m = firstLine[1]
    let d = firstLine[2]
    var adj = [[(dest: Int, cost: Int)]](repeating: [], count: n + 1)
    for _ in 1...m{
        let input = readLine()!.split(separator: " ").map { Int( $0 )! }
        let src = input[0]
        let dest = input[1]
        let cost = input[2]
        adj[src].append((dest: dest, cost: cost))
    }
    print(primMST(adj, n))
    
    for x in adj {
        print(x)
    }
    
}



public func primMST(_ graph: [[(dest: Int, cost: Int)]], _ n: Int) -> Int {
    var pq = IndexPriorityQueue<Graph>(>)
    var minCost = 0
    
    var visited = [Bool](repeating: false, count: graph.count)
    for value in graph[1]{
        pq.enqueue(Graph(src: 1,dest: value.dest,weight: value.cost))
        
    }
    visited[0] = true
    while  !pq.isEmpty {
        let g = pq.dequeue()!
        //print("src \(g.src) dest \(g.dest) weight \(g.weight)")
        if !visited[g.dest] {
            print("src \(g.src) dest \(g.dest) weight \(g.weight)")
            visited[g.dest] = true
            minCost += g.weight
            for value in graph[g.dest]{
                pq.enqueue(Graph(src: g.dest,dest: value.dest,weight: value.cost))
                
            }
        }
    }
    return minCost
}

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


