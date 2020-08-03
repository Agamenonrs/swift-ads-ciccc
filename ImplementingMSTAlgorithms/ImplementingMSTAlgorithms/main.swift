//
//  main.swift
//  ImplementingMSTAlgorithms
//
//  Created by Agamenon Rocha Dos Santos on 30/07/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import Foundation
/*
 var pq = IndexPriorityQueue<Pair>(>)
 pq.enqueue(Pair(v: 1, weight: 5))
 pq.enqueue(Pair(v: 3, weight: 1))
 pq.enqueue(Pair(v: 2, weight: 3))
 
 print(pq.dequeue()!)
 print(pq.dequeue()!)
 print(pq.dequeue()!)
 
 */

var mst = MST()

//var graph: [[(v: Int, w: Int)]] = [[(v:0,w:5),(v:2,w:1),(v:1,w:3)]]
var graph: [[(v: Int, w: Int)]] = [[(v:1,w:6),(v:2,w:1),(v:3,w:5)],
                                   [(v:2,w:5),(v:4,w:3)],
                                   [(v:3,w:5), (v:4,w:6),(v:5,w:4)],
                                   [(v:5,w:2)],
                                   [(v:5,w:6)]]

print(mst.primMST(graph))
print(mst.kruskalMST(graph))


