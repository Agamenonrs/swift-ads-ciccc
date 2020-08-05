//
//  MST.swift
//  ImplementingMSTAlgorithms
//
//  Created by Agamenon Rocha Dos Santos on 30/07/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import Foundation

/// Minimum Spanning Tree Algorithms
public final class MST {
    
    /// Prim's MST Algorithm O(ElgV)
    /// Use Priority Queue (Binary Heap) and Adjacency List
    /// - Parameter graph: adjacency list of weighted undirected graph where each edge is stored as Tuple
    /// - Returns: the minimum cost spanning tree
    public func primMST(_ graph: [[(v: Int, w: Int)]]) -> Int {
        var pq = IndexPriorityQueue<Graph>(>)
        var minCost = 0
        var edges: Set<Int> = []
//        for i in 0..<graph.count {
//            totalEdges += graph[i].count
//        }
        
        for i in 0..<graph.count {
            for value in graph[i]{
                edges.insert(value.v)
            }
        }
        
        let numVertices = edges.max()!
        var adj = [[(v: Int,w: Int)]](repeating: [], count: numVertices + 1)
        for i in 0..<graph.count {
            for value in graph[i]{
                adj[i].append(value)
                adj[value.v].append((i,value.w))
            }
        }
        
        var visited = [Bool](repeating: false, count: numVertices + 1)
        for value in graph[0]{
            pq.enqueue(Graph(src: 0,dest: value.v,weight: value.w))
            
        }
        visited[0] = true
        while  !pq.isEmpty {
            let g = pq.dequeue()!
            //print("src \(g.src) dest \(g.dest) weight \(g.weight)")
            if !visited[g.dest] {
                //print("src \(g.src) dest \(g.dest) weight \(g.weight)")
                visited[g.dest] = true
                minCost += g.weight
                for value in adj[g.dest]{
                    pq.enqueue(Graph(src: g.dest,dest: value.v,weight: value.w))
                    
                }
                
            }
            
        }
        return minCost
    }
    
    /// Kruskal's MST Algorithm O(ElgE)
    /// Use Union-Find and Adjacency List (You can use Swift's built-in sort method.)
    /// - Parameter graph: adjacency list of weighted undirected graph where each edge is stored as Tuple
    /// - Returns: the minimum cost spanning tree
    public func kruskalMST(_ graph: [[(v: Int, w: Int)]]) -> Int {
        
        var minCost: Int = 0
        var adj: [Graph] = []
        var vestices: Set<Int> = []
        for i in 0..<graph.count {
            for value in graph[i]{
                vestices.insert(value.v)
                adj.append(Graph(src: i, dest: value.v, weight: value.w))
            }
        }
        adj.sort(by: { $0.weight < $1.weight })
        //print(adj)
        var uf = UF(vestices.max()! + 1)
        
        for g in adj {
           if !uf.connected(g.src, g.dest){
                minCost += g.weight
                uf.union(g.src, g.dest)
            }
        }

        return minCost
    }
}
