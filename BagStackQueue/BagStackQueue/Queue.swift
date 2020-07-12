//
//  Queue.swift
//  BagStackQueue
//
//  Created by Agamenon Rocha Dos Santos on 12/07/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import Foundation

public final class Queue<E> : Sequence{
    
    private var first: Node<E>? = nil
    private var last: Node<E>? = nil
    private(set) var count: Int = 0
    
    init() {
        
    }
    
    fileprivate class Node<E> {
        fileprivate var item: E
        fileprivate var next: Node<E>?
        fileprivate var privious: Node<E>?
        fileprivate init(item: E, privious: Node<E>? = nil,next: Node<E>? = nil){
            self.item = item
            self.privious = privious
            self.next = next
            
        }
    }
    
    /// Add Element
    func enqueue(item: E){
        let oldLast = last
        last = Node<E>(item: item,privious: oldLast)
        last?.privious?.next = last
        if(count == 0){
            first =  last
        }
        count += 1
    }
    
    /// Removes and returns the item most recently
    /// add to the stack
    func dequeue() -> E?{
        let newFirst = first?.next
        first = newFirst
        count -= 1
        return first?.item
    }
    
    func peek() -> E?{
        return first?.item
    }
    
    func isEmpty() -> Bool{
        return last == nil
    }
    
    /// You have to create that to sequence
    public struct QueueIterator<E> : IteratorProtocol{
        
        private var current: Node<E>?
        
        fileprivate init(_ first: Node<E>?){
            self.current = first
        }
        
        public mutating func next() -> E? {
            if let item = current?.item {
                current = current?.next
                return item
            }
            return nil
        }
        
        public typealias Element = E
    }
    /// Returns an iterator that iteratoes over
    public func makeIterator() -> QueueIterator<E> {
        return QueueIterator<E>(first)
    }
    
    
}

extension Queue: CustomStringConvertible{
    public var description: String {
        return self.reduce(into: ""){ $0 += "\($1), "}
    }
}
