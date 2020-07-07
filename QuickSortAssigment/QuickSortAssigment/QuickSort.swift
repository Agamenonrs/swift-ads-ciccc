//
//  QuickSort.swift
//  QuickSortAssigment
//
//  Created by Agamenon Rocha Dos Santos on 06/07/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import Foundation

func quickSortTest(){
    var numbers: [Int] = [3,2,7,5,4,1,10,6]
    quickSort(&numbers, from: 0, to: numbers.count, >)
    print(numbers)
}

func quickSort<T: Comparable>(_ arr: inout [T], from start: Int, to end: Int, _ comparator: (T,T)-> Bool) {
    let elements = end - start
    if elements > 1 {
        let position =  partition(&arr,from: start, to: end, comparator)
        quickSort(&arr, from: start, to: position,comparator)
        quickSort(&arr, from: position + 1, to: end,comparator)
    }
}
/// Returns the index of the pivot
/// - Parameters:
///   - arr: the array
///   - start: the start index
///   - end: the end index
/// - Returns: the index of the pivot after partitioning
func partition<T: Comparable>(_ arr: inout [T], from start: Int, to end: Int, _ comparator: (T,T)-> Bool) -> Int {
  let pivot = arr[end - 1]
  var lessThan = start
  for index in start..<end - 1 {
      if comparator(pivot,arr[index]) {
        arr.swapAt(lessThan, index)
          lessThan += 1
          
      }
  }
  arr.swapAt(lessThan, end - 1 )
  return lessThan
}
