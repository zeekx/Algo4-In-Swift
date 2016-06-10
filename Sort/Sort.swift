//
//  Sort.swift
//  Algo4
//
//  Created by zeek on 16/6/6.
//  Copyright © 2016年 Zeek. All rights reserved.
//

import Cocoa

class Sort<T:Comparable > : NSObject {
    internal class func sort(inout sequence :[T]) {
    }
    
    internal class func less(l: T, r: T) -> Bool {
        return l < r
    }
    
    private class func exchange(inout sequence:[T], l: Int , r: Int) /*throws*/ {
        let tmp:T = sequence[l]
        sequence[l] = sequence[r]
        sequence[r] = tmp
    }
    
    class func show(sequence:[T]) {
        print("\n" + sequence.description)
    }
    
    class func isSorted(sequence:[T]) -> Bool {
        for index in 1..<sequence.count {
            if !less(sequence[index-1], r: sequence[index]) {
                return false
            }
        }
        return true
    }
}

class BubbleSort<T:Comparable>: Sort<T> {
    class override func sort(inout sequence :[T]) {
        for i in (0 ..< sequence.count).reverse() {
            var hasSorted = true
            for j in 0 ..< i {
                if less(sequence[j+1], r: sequence[j]) {
                    hasSorted = false
                    exchange(&sequence, l: j+1, r: j)
//                    print(sequence.description)
                }
            }//for-j
            if hasSorted {
                break
            }
        }//for-i
    }
}

class SelectionSort<T : Comparable> : Sort<T> {
    //Version1: select min from right to left in unsort to trail
    // [head, trail)
//    class private func selectMaxIndex(sequence : [T], trail : Int , _ head : Int) -> Int {
//        var indexOfMax = head
//        for i in head ..< trail {
//            if !less(sequence[i], r : sequence[indexOfMax]) {
//                indexOfMax = i
//            }
//        }
//        return indexOfMax
//    }
//    

//    class override func sort(inout sequence :[T])  {
//        for i in (0 ..< sequence.count).reverse() {
//            let max = selectMaxIndex(sequence, trail: i + 1, 0)
//            exchange(&sequence, l: i, r: max)
//        }
//    }
    
    //Version2: select min from left to right in unsort to head
    class override func sort(inout sequence : [T]) {
        for i in 0 ..< sequence.count {
            var indexOfMinInUnsorted = i
            for IndexOfUnsorted in i + 1 ..< sequence.count {
                if less(sequence[IndexOfUnsorted],r: sequence[indexOfMinInUnsorted]) {
                    indexOfMinInUnsorted = IndexOfUnsorted
                }
            }
            exchange(&sequence, l: i, r: indexOfMinInUnsorted)
        }
    }
}

class InsertionSort<T : Comparable>: Sort< T > {
    class override func sort(inout sequence : [T]) {
        for i in 1 ..< sequence.count {
            let tmp = sequence[i]
            var j = i
            while j > 0 && less(tmp, r:sequence[j-1]) {
                sequence[j] = sequence[j-1]
                j -= 1
            }
            sequence[j] = tmp
        }
    }
}

class ShellSort<T : Comparable> : Sort<T> {
    class override func sort(inout sequence : [T]) {
        var h = 1
        while (h < sequence.count / 3) {
            h =  3 * h + 1
        }
        while h >= 1 {
            for i in h ..< sequence.count {
                var j = i
                while j >= h && less(sequence[j], r: sequence[j-h]) {
                    exchange(&sequence, l: j, r: j-h)
                    j -= h
                }
            }
            h /= 3
        }
    }
}