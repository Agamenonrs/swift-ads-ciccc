//
//  Bag.swift
//  BagStackQueue
//
//  Created by Agamenon Rocha Dos Santos on 04/07/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import Foundation
let bugs = ["Aphid", "Bumblebee", "Mosquito","Cicade", "Damselfly", "Earwig"]

func callHasMosquito(){
    var hasMosquito = false
    for bug in bugs{
        if bug == "Mosquito"{
            hasMosquito = true
            break
        }
    }
    print("'bugs' has a mosquito: \(hasMosquito)")
}

func callContainsInBugsSequence(){
    if bugs.contains("Mosquito") {
        print("Break out the bug spray")
    }else{
        print("Whew, no mosquito")
    }
}


struct Countdown: Sequence, IteratorProtocol{
    var count: Int
    
    mutating func next()-> Int? {
        if count == 0 {
            return nil
        } else {
            defer { count -= 1}
            return count
        }
    }
}

func callCountdown(){
    let threeToGo = Countdown(count: 3)
    for i in threeToGo {
        print(i)
    }
}



