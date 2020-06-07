//
//  Week_03.swift
//  Algorithm
//
//  Created by Leibi on 2020/6/7.
//  Copyright © 2020 Leibi. All rights reserved.
//

import Foundation

class Geek03 {
    
}

extension Geek03 {
    //MARK: - 236.二叉树的最近公共祖先
    func startLowestCommonAncestor() {
        let node3 = TreeNode.init(3)
        let node5 = TreeNode.init(5)
        let node1 = TreeNode.init(1)
        let node6 = TreeNode.init(6)
        let node2 = TreeNode.init(2)
        let node0 = TreeNode.init(0)
        let node8 = TreeNode.init(8)
        let node7 = TreeNode.init(7)
        let node4 = TreeNode.init(4)
        
        node3.left = node5
        node3.right = node1
        node5.left = node6
        node5.right = node2
        node2.left = node7
        node2.right = node4
        node1.left = node0
        node1.right = node8
        
        if let commonRoot = self.lowestCommonAncestor(node3, node5, node1) {
            print("common root: \(commonRoot.val)")
        } else {
            print("no common root!")
        }
    }
    
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q:TreeNode?) -> TreeNode? {
        if root == nil || root === p || root === q {
            return root
        }
        
        let left = lowestCommonAncestor(root?.left, p, q)
        let right = lowestCommonAncestor(root?.right, p, q)
        
        if left == nil && right == nil {
            return nil
        }
        
        if left == nil {
            return right
        }
        
        if right == nil {
            return left
        }
        
        return root
    }
    
    //MARK: - 105. 从前序与中序遍历序列构造二叉树
    func startBuildTree() {
        if let root = self.buildTree([3, 9, 20, 15, 7], [9, 3, 15, 20, 7]) {
            print("tree root: \(root)")
        } else {
            print("can not generate tree")
        }
    }
    
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        if preorder.count != inorder.count || preorder.isEmpty {
            return nil
        }
        
        var inorderIndex: [Int: Int] = [:]
        for index in inorder.indices {
            inorderIndex[inorder[index]] = index
        }
        
        func buildChildTree(_ pLeft: Int, _ pRight: Int, _ iLeft: Int, _ iRight: Int) -> TreeNode? {
            let rootVal = preorder[pLeft]
            let rootNode = TreeNode(rootVal)
            guard let inorderIndexOfRootVal = inorderIndex[rootVal] else {
                fatalError("Some Error")
            }

            let lchildOrderLength = inorderIndexOfRootVal - iLeft
            if lchildOrderLength > 0 {
                let childPLeft  = pLeft + 1
                let childPRight = childPLeft + lchildOrderLength - 1
                let childILeft  = iLeft
                let childIRight = inorderIndexOfRootVal - 1
                rootNode.left = buildChildTree(childPLeft, childPRight, childILeft, childIRight)
            }
            
            let rchildOrderLength = iRight - inorderIndexOfRootVal
            if rchildOrderLength > 0 {
                let childPLeft  = pRight - rchildOrderLength + 1
                let childPRight = pRight
                let childILeft  = inorderIndexOfRootVal + 1
                let childIRight = iRight
                rootNode.right = buildChildTree(childPLeft, childPRight, childILeft, childIRight)
            }
            return rootNode
        }
        
        let pLeft  = 0
        let pRight = preorder.count - 1
        let iLeft  = 0
        let iRight = inorder.count - 1
        
        return buildChildTree(pLeft, pRight, iLeft, iRight)
    }
}
