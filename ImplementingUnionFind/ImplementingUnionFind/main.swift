//
//  main.swift
//  ImplementingUnionFind
//
//  Created by Agamenon Rocha Dos Santos on 27/07/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import Foundation

var uf = UF(10)
print("union 1 and 2")
uf.union(1, 2)
print("count after union \(uf.count)")
print("find 2 root:  \(uf.find(2))")
print("is 1 and 2 connected ? \(uf.connected(1, 2)) ")

print("union 1 and 3 ")
uf.union(3, 1)
print("count after union \(uf.count)")
print("find 3 root:  \(uf.find(3))")
print("is 1 and 3 connected ? \(uf.connected(1, 3)) ")


