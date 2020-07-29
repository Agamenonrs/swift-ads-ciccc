//
//  CourseSchedule.swift
//  DAGTopologicalSort
//
//  Created by Agamenon Rocha Dos Santos on 28/07/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import Foundation

func isPossibleFinishAllCourses(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
    var result: [Int] = []
    var indegree = [Int](repeating: 0, count: numCourses)
    var adj = [[Int]](repeating: [Int](), count: numCourses)

    for p in prerequisites {
        let u = p[0]
        let v = p[1]
        adj[v].append(u)
        indegree[u] += 1
    }
    
    let q = Queue<Int>()
    for i in 0..<numCourses {
        if indegree[i] == 0 {
            q.enqueue(item: i)
        }
    }
    
    // BSF
    while !q.isEmpty(){
        let u = q.dequeue()!
        result.append(u)
        for v in adj[u] {
            indegree[v] -= 1
            if indegree[v] == 0 {
                q.enqueue(item: v)
            }
        }
    }
    return result.count == numCourses
}
