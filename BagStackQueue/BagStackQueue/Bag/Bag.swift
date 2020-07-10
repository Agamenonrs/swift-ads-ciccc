//
//  Bag.swift
//  BagStackQueue
//
//  Created by Agamenon Rocha Dos Santos on 08/07/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import Foundation

/// The **Bag** represents a bag of generic items.
///
public final class Bag<E> : Sequence {
    
    private var first: Node<E>? = nil
    
    private(set) var count: Int = 0
    
    ///
    fileprivate class Node<E> {
        fileprivate var item: E
        fileprivate var next: Node<E>?
        fileprivate init(item: E, next: Node<E>? = nil){
            self.item = item
            self.next = next
        }
    }
    
    init() {
        
    }
    
    public func isEmpty() -> Bool {
        return first == nil
    }
    
    /// Adds the item to this bag (front)
    ///
    public func add(item: E){
        let oldFirst = first
        first = Node<E>(item: item, next: oldFirst)
        count += 1
    }
    
    /// You have to create thato to sequence
    public struct BagIterator<E> : IteratorProtocol{
        
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
    public func makeIterator() -> BagIterator<E> {
        return BagIterator<E>(first)
    }
}

extension Bag: CustomStringConvertible{
    public var description: String {
        return self.reduce(into: ""){ $0 += "\($1), "}
    }
}
