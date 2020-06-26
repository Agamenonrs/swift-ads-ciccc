//
//  MyFileManager.swift
//  MiniProject1
//
//  Created by Agamenon Rocha Dos Santos on 25/06/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import Foundation

func getCurrentDirectory(){
    let fileManager = FileManager.default
    // Get current directory path
    let path = fileManager.currentDirectoryPath
    print(path)
}

//func readDocumentDirectory(){
//    let documentsUrl =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//    do {
//        // Get the directory contents urls (including subfolders urls)
//        let directoryContents = try FileManager.default.contentsOfDirectory(at: documentsUrl, includingPropertiesForKeys: nil)
//        print(directoryContents)
//        // if you want to filter the directory contents you can do like this:
//        let mp3Files = directoryContents.filter{ $0.pathExtension == "mp4" }
//        print("mp4 urls:",mp3Files)
//        let mp3FileNames = mp3Files.map{ $0.deletingPathExtension().lastPathComponent }
//        print("mp4 list:", mp3FileNames)
//    } catch {
//        print(error)
//    }
//}

//├─
//└─
//│


func readDocumentDirectory2(urlPath : URL, _ padding : String){
    
    do {
        // Get the directory contents urls (including subfolders urls)
        let directoryContents = try FileManager.default.contentsOfDirectory(at: urlPath, includingPropertiesForKeys: nil, options: .includesDirectoriesPostOrder)
        let fileManager = FileManager.default
        var isDir : ObjCBool = false
        for d in directoryContents{
            //print(d.relativePath)
            if fileManager.fileExists(atPath: d.relativePath, isDirectory:&isDir) {
                if isDir.boolValue {
                    print(padding, d.lastPathComponent)
                    let p = padding.replacingOccurrences(of: "├─", with: "│ ├─")
                    readDocumentDirectory2(urlPath: d, p)
                } else {
                    print(padding, d.lastPathComponent)
                }
            } else {
                print("File does not exist")
            }
        }
    } catch {
        print(error)
    }
}
