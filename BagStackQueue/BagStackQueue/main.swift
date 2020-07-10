//
//  main.swift
//  BagStackQueue
//
//  Created by Agamenon Rocha Dos Santos on 04/07/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import Foundation

//callHasMosquito()
//callContainsInBugsSequence()
//callCountdown()

var bag = Bag<String>()
bag.add(item: "Martin")
bag.add(item: "Leandro")
bag.add(item: "Melisa")

print(bag.isEmpty())
print(bag.count)

for item in bag {
    print(item)
}

print(bag)
