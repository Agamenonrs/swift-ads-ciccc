//
//  main.swift
//  MiniProject1
//
//  Created by Agamenon Rocha Dos Santos on 25/06/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import Foundation

//getCurrentDirectory()
//readDocumentDirectory()
print("Type directory ")
let dir = readLine()
let url = URL(fileURLWithPath: dir!)
//let documentsUrl =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//readDocumentDirectory2(urlPath: documentsUrl,"├─")
var count: [Int] = [0,0]
print("count size \(count.count)")
readDocumentDirectory(urlPath: url,"├─", count: &count )
print("\(count[0]) directories, \(count[1]) files")

