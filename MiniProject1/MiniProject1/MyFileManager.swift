//
//  MyFileManager.swift
//  MiniProject1
//
//  Created by Agamenon Rocha Dos Santos on 25/06/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import Foundation

//├─
//└─
//│


func readDocumentDirectory(urlPath : URL, _ padding : String, count: inout [Int]) {
    
    do {
        // Get the directory contents urls (including subfolders urls)
        let directoryContents = try FileManager.default.contentsOfDirectory(at: urlPath, includingPropertiesForKeys: nil, options: .includesDirectoriesPostOrder)
        let fileManager = FileManager.default
        var isDir : ObjCBool = false
        for d in directoryContents{
            if fileManager.fileExists(atPath: d.relativePath, isDirectory:&isDir) {
                if isDir.boolValue {
                    print(padding, d.lastPathComponent)
                    let p = padding.replacingOccurrences(of: "├─", with: "│ ├─")
                    count[0]+=1
                    readDocumentDirectory(urlPath: d, p,count: &count)
                    
                } else {
                    print(padding, d.lastPathComponent)
                    count[1]+=1
                }
            } else {
                print("Direcotory or File does not exist")
            }
        }
    } catch {
        print(error)
    }
    
}


