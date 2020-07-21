//
//  LCA.swift
//  LCAAssignment
//
//  Created by Agamenon Rocha Dos Santos on 19/07/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import Foundation


func findLCA6(){
    print("begin")
    // # of vertices
    //let n = Int(readLine()!)!
    let n = 15
    // # of edges
    let m = n - 1
    
    //adjacency list
    //var adjList = [[Int]](repeating: [], count: n + 1)
    var adjList = [[], [2, 3], [1, 4, 6, 5], [1, 7, 8], [2, 9, 10], [2, 11, 12], [2], [3, 13, 14], [3], [4], [4], [5, 15], [5], [7], [7], [11]]
    //    for _ in 0..<m {
    //        let edge = readLine()!.split(separator: " ")
    //        let u = Int(edge[0])!
    //        let v = Int(edge[1])!
    //        adjList[u].append(v)
    //        adjList[v].append(u)
    //    }
    
    //let edgesToCheck = Int(readLine()!)!
    let edgesToCheck = 1
    //var edgesToCheckList = [[[Int]](repeating: [], count: edgesToCheck)]
    let edgesToCheckList = [[6,11]]
    //    for index in 0..<edgesToCheck {
    //        let edge = readLine()!.split(separator: " ")
    //        let u = Int(edge[0])!
    //        let v = Int(edge[1])!
    //        edgesToCheckList[index].append(u)
    //        edgesToCheckList[index].append(v)
    //    }
    print("fill the list")
    //print(adjList)
    print("")
    //print(edgesToCheckList)
    
    
    func dfs(start: Int, adjList: inout [[Int]], visited: inout [Bool], p:Int, _ found: inout Bool, _ array: inout [Int]) -> Int {
        visited[start] = true
        var vp = -1
        for v in adjList[start] {
            if !visited[v] && !found  {
                
                if v == p {
                    found = true
                    
                }
                if found {
                    array.append(start)
                    vp = start
                    //print(start)
                }
                else {
                   vp = dfs(start: v, adjList: &adjList, visited: &visited, p:p, &found, &array)
                    if(vp != -1  && found){
                        print(" print vp \(vp)")
                    }
                   
                }
            }
        }
        
        
        return vp
    }
    
    var visited = [Bool](repeating: false, count: n + 1)
    var found = false
    var array1: [Int] = []
    var array2: [Int] = []
    dfs(start: 1, adjList: &adjList, visited: &visited,p: 2, &found, &array1)
    found = false
    visited = [Bool](repeating: false, count: n + 1)
    dfs(start: 1, adjList: &adjList, visited: &visited,p: 6, &found, &array2)
    //print(array1)
    //print(array2)
    var parent = -1
    if array1.count > array2.count {
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
}

