//
//  Week_08.swift
//  Algorithm
//
//  Created by Leibi on 2020/7/12.
//  Copyright © 2020 Leibi. All rights reserved.
//

import Foundation

class Geek08 {
    
}

extension Geek08 {
    //MARK: - 146、URL缓存机制
    class Node {
        var valPair: (Int, Int)
        var next: Node? = nil
        var pre: Node? = nil
        init(_ valPair: (Int, Int)) {
            self.valPair = valPair
        }
    }

    class LRUCache {
        var hashTable: [Int: Node] = [:]
        var head: Node? = nil
        var tail: Node? = nil

        let capacity: Int
        init(_ capacity: Int) {
            self.capacity = capacity
        }
        
        func get(_ key: Int) -> Int {
            if let exist = hashTable[key] {
                let node = Node(exist.valPair)
                removeNodeFromLinkedList(exist)
                insetToLinkedListHead(node)
                return node.valPair.1
            } else {
                return -1
            }
        }
        
        func put(_ key: Int, _ value: Int) {
            if let existNode = hashTable[key] {
                removeNodeFromLinkedList(existNode)
                insetToLinkedListHead(Node((key, value)))
            } else {
                if hashTable.keys.count >= capacity {
                    removeNodeFromLinkedList(tail)
                }
                insetToLinkedListHead(Node((key, value)))
            }
        }

        func removeNodeFromLinkedList(_ node: Node?) {
            if node === tail {
                let pre: Node? = node?.pre
                pre?.next = nil
                node?.pre = nil
                tail = pre
            }
            
            if node === head {
                let next: Node? = node?.next
                node?.next = nil
                next?.pre = nil
                head = next
            }

            let pre: Node? = node?.pre
            let next: Node? = node?.next
            node?.pre = nil
            node?.next = nil
            pre?.next = next
            next?.pre = pre

            if let n = node {
                hashTable[n.valPair.0] = nil
            }
        }
        func insetToLinkedListHead(_ node: Node) {
            let node = node
            if head == nil || tail == nil {
                head = node
                tail = node
            } else {
                node.next = head
                head?.pre = node
                head = node
            }
            hashTable[node.valPair.0] = node
        }
    }
    
    //MARK: - 56、合并区间
    func merge(_ intervals: [[Int]]) -> [[Int]] {
          
        var arry = intervals
        let count = intervals.count
        if count < 2{
            return arry
        }
        let maxEnd = count - 1
        self.SortFun(&arry,0,maxEnd)
        var markMid = arry[0]
        var backArry = [[Int]]()
        for index in (0..<count){
            let ele = arry[index]
            if ele[0] > markMid[1]{
                backArry.append(markMid)
                markMid = ele
            } else if (ele[1] > markMid[1]) {
                markMid = [markMid[0],ele[1]]
            }
        }
        backArry.append(markMid)
        return backArry
    }
    
    func SortFun(_ intervals: inout [[Int]],_ start:Int,_ end:Int ){
    
        if (start + 1) == end{
            let left = intervals[start]
            let rignt = intervals[end]
            if left[0] > rignt[0]{
                _ = left
                intervals[start] =  rignt
                intervals[end] = left
            }
            return
        }

        let saveEle = intervals[start]
        var startM = start + 1
        var endM = end
        while (startM < endM){
            let leftValue = intervals[startM]
            let rightValue = intervals[endM]
            if leftValue[0] < saveEle[0] {
                startM = startM + 1
            } else {
                if rightValue[0] > saveEle[0] {
                    endM = endM - 1
                } else {
                    let inMiddle = leftValue
                    intervals[startM] = rightValue
                    intervals[endM] = inMiddle
                    startM = startM + 1
                    endM = endM - 1
                }
            }
        }
          
        var mid = endM
        let midV = intervals[endM]
        if midV[0] < saveEle[0] {
            intervals[start] = midV
            intervals[endM] = saveEle
        } else {
            let midVbefor = intervals[endM-1]
            intervals[start] = midVbefor
            intervals[endM-1] = saveEle
            mid = endM - 1
        }
          
        if start < mid {
            self.SortFun(&intervals,start,mid)
        }
        
        if (mid+1) < end {
            self.SortFun(&intervals,(mid+1),end)
        }
    }
}
