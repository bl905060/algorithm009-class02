//
//  Week_01.swift
//  Algorithm
//
//  Created by Leibi on 2020/5/23.
//  Copyright © 2020 Leibi. All rights reserved.
//

import Foundation

class Geek01 {
    
}

extension Geek01 {
    
    //MARK: - 88.删除排序数组中的重复项
        func removeDuplicates(_ nums: inout [Int]) -> Int {
            guard nums.count > 1 else {
                return nums.count
            }

            var slow = 0, fast = 0

            while fast < nums.count {
                if nums[fast] != nums[slow] {
                    slow += 1
                    nums[slow] = nums[fast]
                }

                fast += 1
            }

            return slow + 1
        }
}

extension Geek01 {
    //MARK: - 189.旋转数组
    class func startRotate() {
        var nums = [1, 2, 3, 4, 5, 6, 7]
        print(ArraySolution.init().rotate(&nums, 3))
    }
    
    func rotate(_ nums: inout [Int], _ k: Int) {
        guard nums.count > 1 else {
            return
        }
    
        let k = k % nums.count
        self.reversed(&nums, 0, nums.count - 1)
        self.reversed(&nums, 0, k - 1)
        self.reversed(&nums, k, nums.count - 1)
    }

    func reversed(_ nums: inout [Int], _ start: Int, _ end: Int) {
        var start = start
        var end = end
        while start < end {
            let temp = nums[start]
            nums[start] = nums[end]
            nums[end] = temp
            start += 1
            end -= 1
        }
    }
}

extension Geek01 {
    
    //MARK: - 21.合并两个有序链表
    class func startMergeTwoLists() {
        let node1 = ListNode.init(1)
        let node2 = ListNode.init(2)
        let node3 = ListNode.init(4)
        let node4 = ListNode.init(1)
        let node5 = ListNode.init(3)
        let node6 = ListNode.init(4)
        
        node1.next = node2
        node2.next = node3
        
        node4.next = node5
        node5.next = node6
        
        let node = LinkedListSolution.init().mergeTwoLists(node1, node4)
        LinkedListSolution.printList(node)
    }
    
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil {
            return l2
        } else if l2 == nil {
            return l1
        }

        
        var head1 = l1
        var head2 = l2
        
        let result: ListNode? = ListNode.init(-1)
        var curr: ListNode? = result

        while head1 != nil && head2 != nil {
            if head1!.val < head2!.val {
                curr!.next = head1
                head1 = head1!.next
            } else {
                curr!.next = head2
                head2 = head2!.next
            }

            curr = curr!.next
        }

        if head1 == nil {
            curr!.next = head2
        } else if head2 == nil {
            curr!.next = head1
        }

        return result?.next
    }
}

extension Geek01 {
    
    //MARK: - 88.合并两个有序数组
    class func startMerge() {
        var nums1 = [1, 2, 3, 0, 0, 0]
        let nums2 = [2, 5, 6]
        ArraySolution().merge(&nums1, 3, nums2, 3)
        print(nums1)
    }
    
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var nums1L = m - 1
        var nums2L = n - 1
        var currL = m + n - 1
        
        while nums1L >= 0 && nums2L >= 0 {
            if nums1[nums1L] > nums2[nums2L] {
                nums1[currL] = nums1[nums1L]
                nums1L -= 1
            } else {
                nums1[currL] = nums2[nums2L]
                nums2L -= 1
            }
            
            currL -= 1
        }
        
        if nums2L >= 0 {
            nums1[...nums2L] = nums2[...nums2L]
        }
    }
}

extension Geek01 {
    
    //MARK: - 1.两数之和
        class func startTwoSum() {
            print(ArraySolution().twoSum([3, 2, 4], 6))
        }
        
        func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
            guard nums.count > 1 else {
                return []
            }

            var diffCached: Dictionary<Int, Int> = [:]
            var index = 0

            while index < nums.count {
                let pos = diffCached[target - nums[index]]

                if pos != nil && pos != index {
                    return [pos!, index]
                }

                diffCached[nums[index]] = index
                index += 1
            }

            return []
        }
}

extension Geek01 {
    
    //MARK: - 283.移动零
        class func startMoveZeros() {
            var nums: Array<Int> = [0, 1, 0, 3, 12]
            ArraySolution().moveZeros(&nums)
            print(nums)
        }
        
        func moveZeros(_ nums: inout [Int]) {
            var noneZeroIndex = 0
            
            for index in 0 ..< nums.count {
                if nums[index] != 0 {
                    nums[noneZeroIndex] = nums[index]
                    if index != noneZeroIndex {
                        nums[index] = 0
                    }
                    
                    noneZeroIndex += 1
                }
            }
        }
}

extension Geek01 {
    //MARK: - 66.加一
        class func startPlusOne() {
            print(ArraySolution().plusOne([1, 2, 3]))
        }
        
        func plusOne(_ digits: [Int]) -> [Int] {
            var nums = digits
            for index in (0 ..< nums.count).reversed() {
                if nums[index] < 9 {
                    nums[index] += 1
                    return nums
                }
                
                nums[index] = 0
            }
            
            nums.insert(1, at: 0)
            return nums
        }
}

extension Geek01 {
    
    //MARK: - 641.设计循环双端队列
    class func startCircularDequeue() {
        let circularDequeue = MyCircularDequeue.init(3)
        assert(circularDequeue.insertLast(1))
        assert(circularDequeue.insertLast(2))
        assert(circularDequeue.insertFront(3))
        assert(circularDequeue.insertFront(4) == false)
        assert(circularDequeue.getRear() == 2)
        assert(circularDequeue.isFull())
        assert(circularDequeue.deleteLast())
        assert(circularDequeue.insertFront(4))
        assert(circularDequeue.getFront() == 4)
    }
    
    class MyCircularDequeue {
        
        public private(set) var capacity: Int
        public private(set) var count: Int = 0
        var dequeue: Array<Int>
        var front: Int = 0, rear: Int = 0
        var lock = NSLock.init()
        
        /** Initialize your data structure here. Set the size of the deque to be k. */
        init(_ k: Int) {
            capacity = k + 1
            dequeue = Array.init(repeating: 0, count: capacity)
        }
        
        /** Adds an item at the front of Deque. Return true if the operation is successful. */
        func insertFront(_ value: Int) -> Bool {
            if isFull() {
                return false
            }
            
            lock.lock()
            front = (front - 1 + capacity) % capacity
            dequeue[front] = value
            count += 1
            lock.unlock()
            return true
        }
        
        /** Adds an item at the rear of Deque. Return true if the operation is successful. */
        func insertLast(_ value: Int) -> Bool {
            if isFull() {
                return false
            }
            
            lock.lock()
            dequeue[rear] = value
            rear = (rear + 1) % capacity
            count += 1
            lock.unlock()
            return true
        }
        
        /** Deletes an item from the front of Deque. Return true if the operation is successful. */
        func deleteFront() -> Bool {
            if isEmpty() {
                return false
            }
            
            lock.lock()
            front = (front + 1) % capacity
            count -= 1
            lock.unlock()
            return true
        }
        
        /** Deletes an item from the rear of Deque. Return true if the operation is successful. */
        func deleteLast() -> Bool {
            if isEmpty() {
                return false
            }
            
            lock.lock()
            rear = (rear - 1 + capacity) % capacity
            count -= 1
            lock.unlock()
            return true
        }
        
        /** Get the front item from the deque. */
        func getFront() -> Int {
            if isEmpty() {
                return -1
            }
            
            return dequeue[front]
        }
        
        /** Get the last item from the deque. */
        func getRear() -> Int {
            if isEmpty() {
                return -1
            }
            
            return dequeue[(rear - 1 + capacity) % capacity]
        }
        
        /** Checks whether the circular deque is empty or not. */
        func isEmpty() -> Bool {
            return front == rear
        }
        
        /** Checks whether the circular deque is full or not. */
        func isFull() -> Bool {
            return (rear + 1) % capacity == front
        }
    }
}

extension Geek01 {
    
    //MARK: - 42.接雨水
    class func startTrap() {
        print(AlgorithmSolution.init().trap([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]))
    }
    
    func trap(_ height: [Int]) -> Int {
        guard height.count > 0 else {
            return 0
        }

        var left = 0, right = height.count - 1
        var left_max = 0, right_max = 0
        var result = 0

        while left < right {
            if height[left] < height[right] {
                if height[left] >= left_max {
                    left_max = height[left]
                } else {
                    result += left_max - height[left]
                }
                left += 1
            } else {
                if height[right] >= right_max {
                    right_max = height[right]
                } else {
                    result += right_max - height[right]
                }
                right -= 1
            }
        }

        return result
    }
}
