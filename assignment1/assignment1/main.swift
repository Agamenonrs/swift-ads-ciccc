//
//  main.swift
//  assignment1
//
//  Created by Agamenon Rocha Dos Santos on 24/06/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import Foundation

//func test(_ str: String){
//    //let char = Character(str)
//    let array = Array(str)
//    //print(char.isNumber)
//    print(array[0])
//    print(array[1])
//    print(str[0,str.count-1])
//}

func evaluate(_ expression: String){
    
    let result = evaluate_helper(expression, 0)
    print(result[0])
}

func evaluate_helper(_ expression : String, _ index : Int)-> [String] {
    if Character(expression[index]).isNumber {
        return [expression[index],String(index)]
    }else{
        
        var i = index + 1
        let lhs = evaluate_helper(expression, i)
        i += 1
        let op = expression[i]
        i += 1
        let rhs = evaluate_helper(expression, i)
        i += 1
        if op == "+" {
            return [String(Int(lhs[0])! + Int(rhs[0])!), String(i)]
        }else{
            return [String(Int(lhs[0])! * Int(rhs[0])!), String(i)]
        }
    }
}

evaluate("(1+(7*3))")






