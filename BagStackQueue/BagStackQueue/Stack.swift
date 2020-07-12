//
//  Stack.swift
//  BagStackQueue
//
//  Created by Agamenon Rocha Dos Santos on 12/07/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import Foundation

public final class Stack<E> : Sequence {
    private var last: Node<E>? = nil
    private(set) var count: Int = 0
    
    init() {
        
    }
    
    fileprivate class Node<E> {
        fileprivate var item: E
        fileprivate var previous: Node<E>?
        fileprivate init(item: E, privious: Node<E>? = nil){
            self.item = item
            self.previous = privious
        }
    }
    
    /// Add Element
    func push(item: E){
        let oldLast = last
        last = Node<E>(item: item, privious: oldLast)
        count += 1
    }
    
    /// Removes and returns the item most recently
    /// add to the stack
    func pop() -> E?{
        let newLast = last?.previous
        last = newLast
        count -= 1
        return last?.item
    }
    
    func peek() -> E?{
        return last?.item
    }
    
    func isEmpty() -> Bool{
        return last == nil
    }
    
    /// You have to create that to sequence
    public struct StackIterator<E> : IteratorProtocol{
        
        private var current: Node<E>?
        
        fileprivate init(_ last: Node<E>?){
            self.current = last
        }
        
        public mutating func next() -> E? {
            if let item = current?.item {
                current = current?.previous
                return item
            }
            return nil
        }
        
        public typealias Element = E
    }
    /// Returns an iterator that iteratoes over
    public func makeIterator() -> StackIterator<E> {
        return StackIterator<E>(last)
    }
    
}

extension Stack: CustomStringConvertible{
    public var description: String {
        return self.reduce(into: ""){ $0 += "\($1), "}
    }
}


