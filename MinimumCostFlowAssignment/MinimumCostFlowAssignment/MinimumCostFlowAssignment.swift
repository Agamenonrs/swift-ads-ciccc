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
 
 5 6 4
 1 2 5
 2 3 5
 1 4 5
 4 5 5
 1 3 2
 1 5 1
 
 5 6 4
 1 2 5
 2 3 1
 1 4 1
 4 5 1
 1 3 2
 1 5 1

 
 **/

func minimumCost(){
    let firstLine = readLine()!.split(separator: " ").map { Int( $0 )! }
    let n = firstLine[0]
    let m = firstLine[1]
    let d = firstLine[2]
    
    var adj = [[(v: Int, w: Int)]](repeating: [], count: n + 1)
    var aux = [Edge]()
    for i in 1...m{
        let input = readLine()!.split(separator: " ").map { Int( $0 )! }
        let src = input[0]
        let dest = input[1]
        let cost = input[2]
        adj[src].append((v: dest, w: cost))
        if i >= n {
            aux.append(Edge(u: src, v: dest, w: cost))
        }
    }
    print(kruskaMST(adj,aux,d))
    
//    for x in adj {
//        print(x)
//    }
    
}

func kruskaMST(_ graph: [[(v: Int, w: Int)]], _ aux: [Edge], _ d: Int) -> Int{
    let n = graph.count
    var mstEdges = [Edge]()
    var allEdges = [Edge]()
    var replaced = false
    for (u, node) in graph.enumerated(){
        for edge in node {
            var newEdge = Edge(u: u, v: edge.v, w: edge.w)
            if !replaced && !aux.contains(newEdge) {
                for e in aux {
                    let newW = newEdge.w - d
                    if newW > 0 && newW < e.w  {
                        replaced = true
                        newEdge = Edge(u: newEdge.u, v: newEdge.v, w: newW)
                        break;
                    }
                }
            }
            allEdges.append(newEdge)
        }
    }
    
    allEdges.sort { $0.w < $1.w }
    var uf = UF(n)
    for edge in allEdges {
        if uf.connected(edge.u,edge.v) { continue }
        uf.union(edge.u,edge.v)
        mstEdges.append(edge)
    }
    for edge in mstEdges{
        print(edge)
    }
    var count = 0
    for o in aux{
        if mstEdges.contains(o) {
            //print(allEdges[i])
            count += 1
        }
    }
    return count
    //return mstEdges.map { $0.w }.reduce( 0, + )
    
}

struct Edge {
    let u: Int
    let v: Int
    let w: Int
}

extension Edge: Equatable{
    
    
    static func == (lhs: Edge, rhs: Edge) -> Bool {
        return lhs.u == rhs.u && lhs.v == rhs.v && lhs.w == rhs.w
    }
    
    
}


//
//  UF.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by Derrick Park on 2/24/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import Foundation

/// The UF struct represents a union-find (disjoint sets) data structure
/// It supports **union** and **find** operations, along with methods for
/// determining whether two nodes are in the same component and the total
/// number of components.
/// - This implementation uses weighted quick union (by size or rank) with
/// full path compression.
/// - Initializing a data structure with **n** nodes takes linear time.
/// - Afterwards, **union**, **find**, and **connected** take logarithmic time
/// (in the worst case) and **count** takes constant time.
/// - Moreover, the amortized time per **union**, **find**, and **connected** operation
/// has inverse Ackermann complexity (which is practically < 5 for 2^(2^(2^(2^16))) - undefined number).
public struct UF {
  /// parent[i] = parent of i
  private var parent: [Int]
  /// size[i] = number of nodes in tree rooted at i
  private var size: [Int]
  /// number of components
  private(set) var count: Int
  
  /// Initializes an empty union-find data structure with **n** elements
  /// **0** through **n-1**.
  /// Initially, each elements is in its own set.
  /// - Parameter n: the number of elements
  public init(_ n: Int) {
    self.count = n
    self.size = [Int](repeating: 1, count: n)
    self.parent = [Int](repeating: 0, count: n)
    for i in 0..<n {
      self.parent[i] = i
    }
  }
  
  /// Returns the canonical element(root) of the set containing element `p`.
  /// - Parameter p: an element
  /// - Returns: the canonical element of the set containing `p`
  public mutating func find(_ p: Int) -> Int {
    try! validate(p)
    var root = p
    while root != parent[root] { // find the root
      root = parent[root]
    }
    var p = p
    while p != root {
      let newp = parent[p]
      parent[p] = root  // path compression
      p = newp
    }
    return root
  }
  
  /// Returns `true` if the two elements are in the same set.
  /// - Parameters:
  ///   - p: one elememt
  ///   - q: the other element
  /// - Returns: `true` if `p` and `q` are in the same set; `false` otherwise
  public mutating func connected(_ p: Int, _ q: Int) -> Bool {
    return find(p) == find(q)
  }
  
  /// Merges the set containing element `p` with the set containing
  /// element `q`
  /// - Parameters:
  ///   - p: one element
  ///   - q: the other element
  public mutating func union(_ p: Int, _ q: Int) {
    let rootP = find(p)
    let rootQ = find(q)
    guard rootP != rootQ else { return } // already connected
    
    // make smaller root point to larger one
    if size[rootP] < size[rootQ] {
      parent[rootP] = rootQ
      size[rootQ] += size[rootP]
    } else {
      parent[rootQ] = rootP
      size[rootP] += size[rootQ]
    }
    count -= 1
  }
  
  private func validate(_ p: Int) throws {
    let n = parent.count
    guard p >= 0 && p < n else {
        return
//      throw RuntimeError.illegalArgumentError("index \(p) is not between 0 and \(n - 1)")
    }
  }
}



