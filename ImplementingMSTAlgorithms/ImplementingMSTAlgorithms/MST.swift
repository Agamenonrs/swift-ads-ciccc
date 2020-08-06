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

struct Graph {
    let src: Int
    let dest: Int
    let weight: Int
}

extension Graph: Comparable, Hashable {
    
    static func < (lhs: Graph, rhs: Graph) -> Bool {
        return lhs.weight < rhs.weight
    }
    static func == (lhs: Graph, rhs: Graph) -> Bool {
        return lhs.weight == rhs.weight
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(weight)
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
     // throw RuntimeError.illegalArgumentError("index \(p) is not between 0 and \(n - 1)")
     print("error")
        return
    }
  }
}

//
//  PriorityQueue.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by Derrick Park on 2/20/19.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import Foundation

/// The `IndexPriorityQueue` class represents an indexed priority queue of generic keys.
/// It supports the usual `enqueue` and `dequeue` operations, along with `delete(at i: )`
/// `contains(key: )` and `update(oldKey: , newKey:)` methods.
/// In order to let the client refer to keys on the priority queue, an integer
/// between **0** and **the number of elements - 1** is associated with each key,
/// the client uses this integer to specify which key to remove or update.
/// It also supports methods for peeking at the top value, testing if the priority queue is empty, and
/// iterating through the keys.
/// This implementation uses a binary heap along with a dictionary to associate keys with integers in
/// the given range.
/// The `enqueue`, `dequeue`, `delete(at i: )` and `update(oldKey: , newKey:)` operations take
/// **Θ(log n)** time in the worst case, where **n** is the number of elements in the priority queue.
/// The `contains(key: )` operation takes **Θ(1)** constant time.
/// Construction takes time proportional to the specified capacity.
/// * Time complexity does not consider array resizing time, we can easily fix this by specifying the max capacity of the priority queue)
/// * Duplicates are not allowed. You can create a wrapper with an unique id.
public struct IndexPriorityQueue<Key: Comparable & Hashable> {
  /// the array that stores the heap's nodes
  private(set) var elements = [Key]()
  /// determines whether this is a max-heap(>) or min-heap(<)
  private var order: (Key, Key) -> Bool
  /// dictionary from elements to its heap position(index) in the `elements` array
  private var indices = [Key: Int]()
  
  /// Returns true if this priority queue is empty
  public var isEmpty: Bool {
    return elements.isEmpty
  }
  
  /// Returns the number of keys on this priority queue.
  public var count: Int {
    return elements.count
  }
  
  /// Returns the min or max key O(1)
  public var peek: Key? {
    return elements.first
  }
  
  /// Initializes an empty indexed priority queue with indices
  /// - Parameter order: order of priority queue (`min <` or `max >`)
  public init(_ order: @escaping (Key, Key) -> Bool) {
    self.order = order
  }
  
  /// Returns the index of the given key element. (amortized constant time **O(1)**)
  /// - Parameter key: key element
  /// - Returns: the index of the given key element
  public func index(of key: Key) -> Int? {
    return indices[key]
  }
  
  /// Is `key` on this priority queue? **O(1)**
  /// - Parameter key: key element
  /// - Returns: `true` if key exists on this priority queue; `false` otherwise.
  public func contains(key: Key) -> Bool {
    return indices[key] != nil
  }
  
  /// Enqueue key element on this priority queue. **O (log N)**
  /// - Parameter key: key element
  public mutating func enqueue(_ key: Key) {
    guard !contains(key: key) else { return }
    elements.append(key)
    indices[key] = elements.count - 1
    siftUp(from: elements.count - 1)
  }
  
  /// Dequeue the root node on this priority queue. **O(log N)**
  /// - Returns: the root node if the priority queue is not empty
  @discardableResult
  public mutating func dequeue() -> Key? {
    if isEmpty { return nil }
    let peek = self.peek!
    swapAt(0, count - 1)
    elements.remove(at: count - 1)
    indices[peek] = nil
    siftDown(from: 0)
    return peek
  }
  
  /// Update the old key to the new key value. **O(log N)**
  /// - Parameters:
  ///   - oldKey: old key
  ///   - newKey: new key
  public mutating func update(oldKey: Key, to newKey: Key) {
    guard let index = indices[oldKey] else { return }
    elements[index] = newKey
    siftDown(from: index)
    siftUp(from: index)
  }
  
  /// Delete the key at index `i` in this priority queue. **O(log N)**
  /// - Parameter i: index of the key to delete
  public mutating func delete(at i: Int) {
    swapAt(i, count - 1)
    elements.remove(at: count - 1)
    indices[elements[i]] = nil
    siftUp(from: i)
    siftDown(from: i)
  }
  
  /**
   Private helper methods
   */
  private mutating func siftUp(from i: Int) {
    var i = i
    while i > 0 && order(elements[parent(of: i)], elements[i]) {
      swapAt(parent(of: i), i)
      i = parent(of: i)
    }
  }
  
  private mutating func siftDown(from i: Int) {
    var i = i
    while left(of: i) < count {
      var j = left(of: i)
      if j < count - 1 && order(elements[j], elements[j + 1]) {
        j += 1
      }
      if !order(elements[i], elements[j]) { break }
      swapAt(i, j)
      i = j
    }
  }
  
  private mutating func swapAt(_ i: Int, _ j: Int) {
    elements.swapAt(i, j)
    indices[elements[i]] = i
    indices[elements[j]] = j
  }
  
  @inline(__always) private func parent(of index: Int) -> Int {
    return (index - 1) / 2
  }
  
  @inline(__always) private func left(of index: Int) -> Int {
    return 2 * index + 1
  }
  
  @inline(__always) private func right(of index: Int) -> Int {
    return 2 * index + 2
  }
}


