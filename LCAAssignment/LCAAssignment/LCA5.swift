//
//  LCA.swift
//  LCAAssignment
//
//  Created by Agamenon Rocha Dos Santos on 19/07/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import Foundation

/*
15
1 2
1 3
2 4
3 7
6 2
3 8
4 9
2 5
5 11
7 13
10 4
11 15
12 5
14 7
6
6 11
10 9
2 6
7 6
8 13
8 15
 
 */

func findLCA5(){
    // # of vertices
    let n = Int(readLine()!)!
    // # of edges
    let m = n - 1
    
    //adjacency list
    var adjList = [[Int]](repeating: [], count: n + 1)
    for _ in 0..<m {
        let edge = readLine()!.split(separator: " ")
        let u = Int(edge[0])!
        let v = Int(edge[1])!
        adjList[u].append(v)
        adjList[v].append(u)
    }
    
    let edgesToCheck = Int(readLine()!)!
    var edgesToCheckList = [[Int]](repeating: [], count: edgesToCheck)
    
    for index in 0..<edgesToCheck {
        let edge = readLine()!.split(separator: " ")
        let u = Int(edge[0])!
        let v = Int(edge[1])!
        edgesToCheckList[index].append(u)
        edgesToCheckList[index].append(v)
    }
    
    
    
    func dfs(start: Int, adjList: inout [[Int]], visited: inout [Bool], p:Int, _ found: inout Bool, _ array: inout [Int]){
        visited[start] = true
        for v in adjList[start] {
            if !visited[v] && !found  {
                if v == p {
                    found = true
                }
                dfs(start: v, adjList: &adjList, visited: &visited, p:p, &found, &array)
                if found {
                    array.append(start)
                }
            }
        }
    }
    
    for index in edgesToCheckList {
        var visited = [Bool](repeating: false, count: n + 1)
        var found = false
        var array1: [Int] = []
        var array2: [Int] = []
        array1.append(index[0])
        dfs(start: 1, adjList: &adjList, visited: &visited,p: index[0], &found, &array1)
        
        found = false
        visited = [Bool](repeating: false, count: n + 1)
        array2.append(index[1])
        dfs(start: 1, adjList: &adjList, visited: &visited,p: index[1], &found, &array2)
        
        var parent = -1
        //print("arr1 \(array1) arr2 \(array2)")
        if array1.count > array2.count {
            var find = false
            for e1 in array1.reversed() {
                for e2 in array2.reversed() {
                    if e1 == e2 {
                        parent = e1
                        find = true
                        break
                    }
                }
                if find {
                    break
                }
            }
        }else {
            var find = false
            for e1 in array1 {
                for e2 in array2 {
                    if e1 == e2 {
                        parent = e1
                        find = true
                        break
                    }
                }
                if find {
                    break
                }
            }
            
        }
        print("parent \(parent)")
        
        /*
         
         6 11
         10 9
         2 6
         7 6
         8 13
         8 15
         
         Sample Output1
         2
         4
         2
         1
         3
         1
         
         */
    }
    
}

