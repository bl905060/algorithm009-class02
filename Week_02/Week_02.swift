//
//  Week_02.swift
//  Algorithm
//
//  Created by Leibi on 2020/5/31.
//  Copyright © 2020 Leibi. All rights reserved.
//

import Foundation

class Geek02 {
    var traversalResult: Array<Int> = []
}

extension Geek02 {
    //MARK: - 94.二叉树的中序遍历 Binary Tree Inorder Traversal
    class func startInorderTraversal() {
        let node1: TreeNode = TreeNode.init(1)
        let node2: TreeNode = TreeNode.init(2)
        let node3: TreeNode = TreeNode.init(3)
        
        node1.right = node2
        node2.left = node3
        
        let result: Array<Int> = TreeSolution.init().inorderTraversal(node1)
        print("inorder traversal: \(result)")
    }
    
    @discardableResult
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        //method1
//        if let root = root {
//            inorderTraversal(root.left)
//            traversalResult.append(root.val)
//            inorderTraversal(root.right)
//        }
//
//        return traversalResult
        
        //method2
        var stack: Array<TreeNode> = []
        var curr: TreeNode? = root
        
        while curr != nil || !stack.isEmpty {
            while curr != nil {
                stack.append(curr!)
                curr = curr?.left
            }
            
            curr = stack.removeLast()
            traversalResult.append(curr!.val)
            curr = curr?.right
        }
        
        return traversalResult
    }
}

extension Geek02 {
    //MARK: - 144.二叉树的前序遍历 Binary Tree Preorder Traversal
    class func startPreorderTraversal() {
        let node1: TreeNode = TreeNode.init(1)
        let node2: TreeNode = TreeNode.init(2)
        let node3: TreeNode = TreeNode.init(3)
        
        node1.right = node2
        node2.left = node3
        
        let result: Array<Int> = TreeSolution.init().preorderTraversal(node1)
        print("inorder traversal: \(result)")
    }
    
    @discardableResult
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        
        if let root = root {
            traversalResult.append(root.val)
            preorderTraversal(root.left)
            preorderTraversal(root.right)
        }
        
        return traversalResult
    }
}

extension Geek02 {
    //MARK: - 1.两数之和
    class func startTwoSum() {
        print(ArraySolution().twoSum([3, 2, 4], 6))
    }
    
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//        guard nums.count > 0 else {
//            return []
//        }
//
//        var diffCache: Dictionary<Int, Int> = [:]
//
//        for index in 0 ..< nums.count {
//            let pos = diffCache[target - nums[index]]
//
//            if pos != nil && pos != index {
//                return [pos!, index]
//            }
//
//            diffCache[nums[index]] = index
//        }
//
//        return []
        
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

extension Geek02 {
    //MARK: - 589.N叉树的前序遍历
    class func startPreorder() {
        let node1: NTreeNode = NTreeNode.init(1)
        let node2: NTreeNode = NTreeNode.init(2)
        let node3: NTreeNode = NTreeNode.init(3)
        let node4: NTreeNode = NTreeNode.init(4)
        let node5: NTreeNode = NTreeNode.init(5)
        let node6: NTreeNode = NTreeNode.init(6)
        
        node1.children = [node3, node2, node4]
        node3.children = [node5, node6]
        
        let result: Array<Int> = TreeSolution.init().preorder(node1)
        print("inorder traversal: \(result)")
    }
    
    @discardableResult
    func preorder(_ root: NTreeNode?) -> [Int] {
        if let root = root {
            traversalResult.append(root.val)
            
            for child in root.children {
                preorder(child)
            }
        }
        
        return traversalResult
    }
}

extension Geek02 {
    //MARK: - 429.N叉树的层序遍历
    class func startLevelOrder() {
        let node1: NTreeNode = NTreeNode.init(1)
        let node2: NTreeNode = NTreeNode.init(2)
        let node3: NTreeNode = NTreeNode.init(3)
        let node4: NTreeNode = NTreeNode.init(4)
        let node5: NTreeNode = NTreeNode.init(5)
        let node6: NTreeNode = NTreeNode.init(6)
        
        node1.children = [node3, node2, node4]
        node3.children = [node5, node6]
        
        let result: Array<Array<Int>> = TreeSolution.init().levelOrder(node1)
        print("level order traversal: \(result)")
    }
    
    func levelOrder(_ root: NTreeNode?) -> [[Int]] {
        //method 1
//        guard let root = root else {
//            return []
//        }
//
//        if root.children.count == 0 {
//            return [[root.val]]
//        }
//
//        var barrier: NTreeNode = root
//        var result: Array<Array<Int>> = []
//        var queue: Array<NTreeNode> = [root]
//        var temp: Array<Int> = []
//
//        while queue.count > 0 {
//            temp.append(queue.first!.val)
//            queue.append(contentsOf: queue.first!.children)
//            let first = queue.removeFirst()
//
//            if first === barrier {
//                result.append(temp)
//                temp.removeAll()
//                if let last = queue.last {
//                    barrier = last
//                }
//            }
//        }
//
//        return result
        
        //method 2
        guard let root = root else {
            return []
        }
        
        var aResult:[[Int]] = []
        actionOfLevelOrder(root , result: &aResult, level: 0)
        return aResult
    }

    func actionOfLevelOrder(_ node:NTreeNode, result:inout [[Int]], level:Int){
        if result.count <= level {
            result.append([])
        }
        
        result[level].append(node.val)
        
        for tmpNode in node.children {
            actionOfLevelOrder(tmpNode, result: &result, level: level + 1)
        }
    }
}
