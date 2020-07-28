//
//  ShortestBridge.swift
//  ProblemSet3
//
//  Created by Agamenon Rocha Dos Santos on 26/07/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import Foundation

/*

10
1 1 1 0 0 0 0 1 1 1
1 1 1 1 0 0 0 0 1 1
1 0 1 1 0 0 0 0 1 1
0 0 1 1 1 0 0 0 0 1
0 0 0 1 0 0 0 0 0 1
0 0 0 0 0 0 0 0 0 1
0 0 0 0 0 0 0 0 0 0
0 0 0 0 1 1 0 0 0 0
0 0 0 0 1 1 1 0 0 0
0 0 0 0 0 0 0 0 0 0

*/
func shortestBridge() -> Int{
    var n = Int(readLine()!)!
    
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    var mapIsland: [[Int]] = []
    
    for _ in 0..<n {
        let row = readLine()!.filter { !" \n\t\r".contains($0) }.map { Int( String( $0 ) )! }
        mapIsland.append(row)
    }
    
    let dirs: [[Int]] = [[1,0],[-1,0],[0,1],[0,-1]]
    let q = Queue<[Int]>();
    var found = false;
    
    func DFS(_ mapIsland: inout [[Int]], _ visited: inout [[Bool]], _ q: Queue<[Int]>, x: Int, y: Int, dirs: [[Int]]){
        if x < 0 || y < 0 ||  x > n || y > n || visited[x][y] || mapIsland[x][y] == 0 {
            return
        }
        visited[x][y] = true
        q.enqueue(item: [x,y])
        for dir in dirs {
            DFS(&mapIsland, &visited, q, x: x + dir[0], y: y + dir[1], dirs: dirs)
        }
    }
    
    for x in 0..<n{
        if found {
            break
        }
        for y in 0..<n {
            if mapIsland[x][y] == 1 {
                DFS(&mapIsland, &visited, q, x: x, y: y, dirs: dirs)
                found = true
                break
            }
        }
    }
    print(mapIsland)
    var count = 0
    while !q.isEmpty() {
        var size = q.count - 1
        while (size - 1)  > 0 {
            size -= 1
            let square = q.dequeue()
            for dir in dirs {
                let nx = square![0] + dir[0]
                let ny = square![1] + dir[1]
                if nx >= 0 && ny >= 0 && nx < n && ny < n && !visited[nx][ny] {
                    if mapIsland[nx][ny] == 1 {
                        return count
                    }
                    q.enqueue(item: [nx,ny])
                    visited[nx][ny] = true
                }
            }
            
        }
        count += 1
    }
    return -1
}
