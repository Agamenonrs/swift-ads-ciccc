//
//  Diameter.swift
//  SushiReviews
//
//  Created by Agamenon Rocha Dos Santos on 23/07/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import Foundation

func Diamiter(){
    
    struct Edge{
        let to: Int
        let distance: Int
    }
    
    func bfs(node: Int, check: inout [Bool], distance: inout [Int], adj: inout [[Edge]] ){
        
        let q = Queue<Int>()
        check[node] = true
        q.enqueue(item: node)
        while !q.isEmpty(){
            let x = q.dequeue()!
            for i in 0..<adj[x].count {
                let edge = adj[x][i]
                if !check[edge.to]{
                    distance[edge.to] = distance[x] + edge.distance
                    q.enqueue(item: edge.to)
                    check[edge.to] = true
                }
                
            }
        }
        
    }
    
    func calcDiameter(){
        let n = Int(readLine()!)!
        var adj = [[Edge]](repeating: [], count: n + 1)
        var check = [Bool](repeating: false, count: n + 1)
        var distances  = [Int](repeating: 0, count: n + 1)
        
        for _ in 1...n {
            let line = readLine()!.split(separator: " ").map{Int($0)!}
            let from = line[0]
            var j = 1
            while j < line.count - 2{
                let to = line[j]
                let dist = line[j + 1]
                adj[from].append(Edge(to: to, distance:dist))
                if line[j + 2] == -1 {
                    break
                }
                j += 2
            }
        }
        bfs(node: 1, check: &check, distance: &distances, adj: &adj)
    }
}
