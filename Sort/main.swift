//
//  main.swift
//  Sort
//
//  Created by zeek on 16/6/6.
//  Copyright © 2016年 Zeek. All rights reserved.
//

import Foundation
import ObjectiveC

func SortTime<T : Comparable>(sortName:String, inout sequence:[T]) {
    let startDate = NSDate()
    NSLog("\(#function)" + sortName + "Sort start")
    switch sortName {
    case "Bubble":
        BubbleSort.sort(&sequence)
        break
    case "Selection":
        SelectionSort.sort(&sequence)
        break
    case "Insertion":
        InsertionSort.sort(&sequence)
        break
    default:
        assert(false, "Not found method of sort for " + sortName)
        break
    }
//    let sel:Selector = NSSelectorFromString("sort")
//    NSThread.detachNewThreadSelector(sel, toTarget: NSClassFromString(sortName + "Sort")!, withObject:(sequence)
    NSLog("\(#function) Finsh. + \(NSDate().timeIntervalSinceDate(startDate))")

}



var seq:[Int] = []

for i in (0 ... 2000).reverse() {
    seq.append(i)
}
var seqCopy = seq
var seqBubbleCopy = seq
var seqSelectionCopy = seq
var seqInsertionCopy = ["S","O","R","T","E","X","A","M","P","L","E"]
//print(seq.description + "\n" + seqCopy.sort().description + "\n\n")

//SortTime("Bubble", sequence: &seqBubbleCopy)
//SortTime("Selection", sequence: &seqSelectionCopy)
SortTime("Insertion", sequence: &seqInsertionCopy)






