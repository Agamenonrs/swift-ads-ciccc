//
//  TomatoFarm.swift
//  ProblemSet3
//
//  Created by Agamenon Rocha Dos Santos on 25/07/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import Foundation
/*

firs input
3 2
000
001

 6 4
 0 0 0 0 0 0
 0 0 0 0 0 0
 0 0 0 0 0 0
 0 0 0 0 0 1

6 4
1 -1 0 0 0 0
0 -1 0 0 0 0
0 0 0 0 -1 0
0 0 0 0 -1 1
 
 5 5
 -1 1 0 0 0
 0 -1 -1 -1 0
 0 -1 -1 -1 0
 0 -1 -1 -1 0
 0 0 0 0 0



how does it work
8 7 6 5 4 3
7 6 5 4 3 2
6 5 4 3 2 1
5 4 3 2 1 1
 
*/

 func tomatoFarm4(){
     struct Square{
         let x: Int
         let y: Int
     }
     
     let dx = [0,0,1,-1]
     let dy = [1,-1,0,0]
    
     /*
     
     using eight direction
     let dx_new = [0,0,1,-1, -1,1,1,-1 ]
     let dy_new = [1,-1,0,0, -1,-1,1,1 ]
     
     */
     
     // 2d to store the town map
     var townMap = [[Int]]()
     
     
    func bfs(q: inout Queue<Square>){
         while !q.isEmpty() {
             let square = q.dequeue()!
             let x = square.x
             let y = square.y
             
             for i in 0..<4{
                 let nx = x + dx[i]
                 let ny = y + dy[i]
                //print ("x \(x) y \(y) nx \(nx) ny \(ny)  ")
                 if nx >= 0 && nx < n && ny >= 0 && ny < m {
//                    print ("townMap[nx][ny] = \(townMap[nx][ny]) groupMap[nx][ny] \(groupMap[nx][ny])")
//                    if nx == 2 && ny == 0 {
//                        print("check")
//                    }
                     if townMap[nx][ny] == 0 && groupMap[nx][ny] == 0{
//                        print("Add to q nx \(nx) ny \(ny)")
                         q.enqueue(item: Square(x: nx, y: ny))
                         groupMap[nx][ny] = groupMap[x][y] + 1
//                         for j in 0...nx{
//                             print(groupMap[j])
//                         }
                         
                     }
                 }
             }
         }
     }
     
     let firstLine = readLine()!.split(separator: " ")
     // # of vertices
     let n = Int(firstLine[1])!
     // # of edges
     let m = Int(firstLine[0])!
     // Ja cria um array de int com a linha :)
     var groupMap = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
     
//     for _ in 0..<n {
//         let row = readLine()!.filter { !" \n\t\r".contains($0) }.map { Int( String( $0 ) )! }
//         townMap.append(row)
//     }
    
    for _ in 0..<n {
        var row: [Int] = []
        let input = readLine()!.split(separator: " ")
        for j in 0..<m{
            row.append(Int(input[j])!)
        }
        townMap.append(row)
    }
    var q = Queue<Square>();
    for x in 0..<n {
         for y in 0..<m {
             if townMap[x][y] == 1 {
                q.enqueue(item: Square(x: x, y: y))
                groupMap[x][y] = 1
             }
         }
     }
    bfs(q: &q)
    var completed = true
    var result = 0
    for i in 0..<n{
        for j in 0..<m {
            if groupMap[i][j] == 0 && townMap[i][j] == 0{
                completed = false
                break
            }else{
                let aux = groupMap[i].max()!
                if aux > result {
                    result = aux
                }
            }
        }
        if !completed {
            result = -1
            break
        }
    }
    
    print(result > -1 ? result - 1 : result )
 }


