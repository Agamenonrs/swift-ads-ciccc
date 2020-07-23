//
//  RepeatingSequence.swift
//  GraphAssignment
//
//  Created by Agamenon Rocha Dos Santos on 22/07/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import Foundation

/*
 
 Sample Input 1
 57 2
 
 Sample Output 1
 4
 */
func repeatSequence2(){
    let input = readLine()!.split(separator: " ")
    let number = Int(input[0])!
    let power = Int(input[1])!
    var sequence: [Int] = []
    sequence.append(number)
    //print("number \(number) power \(power)")
    let characters = Array(input[0])
    var repeated = 0
    
    
    func calcNewValue(characters: Array<Character>){
        var newValue = 0
        for c in characters {
            let value = Int(String(c))!
            newValue += Int(pow(Double(value),Double(power)))
        }
        if repeated == 0  && !sequence.contains(newValue){
            sequence.append(newValue)
            calcNewValue(characters: Array(String(newValue)))
        }else {
            
            if repeated  < 2 && sequence.contains(newValue) {
                repeated = 1
                let index = sequence.firstIndex(of: newValue)
                sequence.remove(at: index!)
                calcNewValue(characters: Array(String(newValue)))
                
            }else {
                repeated = 2
            }
        }
    }
    calcNewValue(characters: characters)
    print(sequence.count)
}
