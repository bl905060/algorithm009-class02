//
//  Week_07.swift
//  Algorithm
//
//  Created by Casperbi on 2020/7/1.
//  Copyright © 2020 Leibi. All rights reserved.
//

import Foundation

class Geek07 {
    
}

extension Geek07 {
    
    //MARK: - 212. 单词搜索 II
    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
        if board.count < 1 {
            return []
        }
        let trie = Trie()
        for word in words {
            trie.insert(word)
        }
        
        var retSet: Set<String> = []
        
        let rowCount = board.count
        let colCount = board[0].count
        var mark: [[Int8]] = [[Int8]].init(repeating: [Int8].init(repeating: 0, count: colCount), count: rowCount)
        
        func dfs(node: Trie.Node, row: Int, col: Int) {
            if node.isWord {
                retSet.insert(node.currentVal)
            }
            if row < 0 || row >= rowCount || col < 0 || col >= colCount {
                return
            }
            if mark[row][col] == 1 {
                return
            }
            if let child = node.getChildNode(for: board[row][col]) {
                defer {
                    mark[row][col] = 0
                }
                mark[row][col] = 1
                dfs(node: child, row: row-1, col: col)
                dfs(node: child, row: row+1, col: col)
                dfs(node: child, row: row,   col: col-1)
                dfs(node: child, row: row,   col: col+1)
            }
        }
        
        for row in 0..<rowCount {
            for col in 0..<colCount {
                dfs(node: trie.root, row: row, col: col)
            }
        }
        return Array(retSet)
    }
    
    //MARK: - 208. 实现 Trie (前缀树)
    class Trie {
        class Node {
            var isWord: Bool = false
            var currentVal: String = ""
            private var nextDict: [Character: Node] = [:]
            
            init(parentVal: String? = nil, char: Character? = nil) {
                if var parentVal = parentVal, let char = char  {
                    parentVal.append(char)
                    self.currentVal = parentVal
                }
            }
            
            @discardableResult
            func defaultChildNode(for char: Character) -> Node {
                if let childNode = self.getChildNode(for: char) {
                    return childNode
                }
                let childNode = Node(parentVal: currentVal, char: char)
                nextDict[char] = childNode
                return childNode
            }
            
            @inlinable
            func getChildNode(for char: Character) -> Node? {
                return nextDict[char]
            }
        }
        
        let root: Node = Node()
        
        func insert(_ word: String) {
            var currentNode = root
            for char in word {
                currentNode = currentNode.defaultChildNode(for: char)
            }
            currentNode.isWord = true
        }
        
        func search(_ word: String) -> Bool {
            var currentNode = root
            for char in word {
                guard let node = currentNode.getChildNode(for: char) else {
                    return false
                }
                currentNode = node
            }
            return currentNode.isWord
        }
        
        func startsWith(_ prefix: String) -> Bool {
            var currentNode = root
            for char in prefix {
                guard let node = currentNode.getChildNode(for: char) else {
                    return false
                }
                currentNode = node
            }
            return true
        }
    }
}
