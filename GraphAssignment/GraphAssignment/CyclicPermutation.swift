//
//  CycloPermutation.swift
//  GraphAssignment
//
//  Created by Agamenon Rocha Dos Santos on 22/07/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import Foundation

/*

Sample Input 1
 
2
8
3 2 7 8 1 4 5 6
10
2 1 3 4 5 6 7 9 10 8
 
Sample Output 1
3
7

Sample Input 2
1
8
3 2 7 8 1 4 5 6
 
1
10
2 1 3 4 5 6 7 9 10 8
 

 */

func cyclicPermutation(){
    
    //A primeira linha e o numero de vertices e o numero de edges
    
    let tests = Int(readLine()!)!
    
    for _ in 0..<tests {
        let n = Int(readLine()!)!
        
        //adjacency list
        var adjList = [[Int]](repeating: [], count: n + 1)
        //print("firstline \(firstLine) n \(n)")
        let edge = readLine()!.split(separator: " ")
    
        for u in 1...n {
            adjList[u].append(Int(edge[u - 1])!)
        }
        //print(adjList)
        
        func dfs(start: Int, adjList: inout [[Int]], visited: inout [Bool]){
            visited[start] = true
            //print(start)
            for v in adjList[start] {
                if v == origin {
                    isCycle = true
                }
                if !visited[v] {
                    dfs(start: v, adjList: &adjList, visited: &visited)
                }
            }
        }
        /*
         visited 'e exatemente o numero de verices + 1
         var adjList = [[Int]](repeating: [], count: n + 1)
         */
        var visited = [Bool](repeating: false, count: n + 1)
        //number of components
        var count = 0;
        var isCycle: Bool
        var origin: Int
        for v in 1..<adjList.count {
            isCycle = false
            origin = v
            if !visited[v] {
                dfs(start: v, adjList: &adjList, visited: &visited)
                if isCycle == true {
                    count += 1
                }
                
            }
        }
        
        print(count)
        
    }
    
    
}
