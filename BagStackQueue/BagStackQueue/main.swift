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

/*
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
 */
/*
var stack = Stack<String>()
stack.push(item: "Martin")
stack.push(item: "Leandro")
stack.push(item: "Melisa")

print(stack.isEmpty())
print(stack.count)

for item in stack {
    print(item)
}

print(stack.pop()!)
print(stack.peek()!)
print(stack)
 */


var queue = Queue<String>()
queue.enqueue(item: "Martin")
queue.enqueue(item: "Leandro")
queue.enqueue(item: "Melisa")

print(queue.isEmpty())
print(queue.count)

for item in queue {
    print(item)
}

//print(queue.dequeue()!)
print(queue.peek()!)
print(queue)



