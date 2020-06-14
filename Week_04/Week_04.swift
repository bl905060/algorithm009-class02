//
//  Week_04.swift
//  Algorithm
//
//  Created by Leibi on 2020/6/14.
//  Copyright © 2020 Leibi. All rights reserved.
//

import Foundation

class Geek04 {
    
}

extension Geek04 {
    //MARK: - 55.跳跃游戏
    func startCanJump() {
        print("result: \(canJump([2, 3, 1, 1, 4]))")
    }
    
    func canJump(_ nums: [Int]) -> Bool {
        guard nums.count > 1 else {
            return false
        }
        
        var endReachable = nums.count - 1
        var index = endReachable
        while index >= 0 {
            if nums[index] + index >= endReachable {
                endReachable = index
            }
            index -= 1
        }
        
        return endReachable == 0
    }
    
    //MARK: - 860.柠檬水找零
    func startLemonadeChange() {
        print("result: \(lemonadeChange([5, 5, 5, 10, 20]))")
    }
    
    func lemonadeChange(_ bills: [Int]) -> Bool {
        guard bills[0] == 5 else {
            return false
        }
        
        var five: Int = 0, ten: Int = 0
        
        for money in bills {
            if money == 5 {
                five += 1
            } else if money == 10{
                if five == 0 {
                    return false
                }
                
                five -= 1
                ten += 1
            } else {
                if five > 0 && ten > 0 {
                    five -= 1
                    ten -= 1
                } else if five >= 3 {
                    five -= 3
                } else {
                    return false
                }
            }
        }
        
        return true
    }
    
    //MARK: - 260.岛屿数量
    func startNumIslands() {
        print("result: \(numIslands([["1","1","1","1","0"],["1","1","0","1","0"],["1","1","0","0","0"],["0","0","0","0","0"]]))")
    }
    
    func numIslands(_ grid: [[Character]]) -> Int {
        //method1: DFS
        let cols = grid.count
            if cols == 0 {
                return 0
            }
            let rows = grid[0].count
            var vGrid = grid
            var count = 0
            for i in 0..<cols {
                for j in 0..<rows {
                    if vGrid[i][j] == "1" {
                        vGrid[i][j] = "0"
                        dfs(grid: &vGrid, cols: cols, rows: rows, i: i, j: j)
                        count += 1
                    }
                }
            }
        return count
     }

    func dfs(grid: inout [[Character]], cols: Int, rows: Int, i: Int, j: Int) {
        for node in adjacent(cols: cols, rows: rows, i: i, j: j) {
            if grid[node.0][node.1] == "1" {
                grid[node.0][node.1] = "0"
                dfs(grid: &grid, cols: cols, rows: rows, i: node.0, j: node.1)
            }
        }
    }

    func adjacent(cols: Int, rows: Int, i: Int, j: Int) -> [(Int, Int)] {
         var r = [(Int, Int)]()
         if i + 1 < cols {
             r.append((i+1, j))
         }
         if i - 1 >= 0 {
             r.append((i-1, j))
         }
         if j + 1 < rows {
             r.append((i, j+1))
         }
         if j - 1 >= 0 {
             r.append((i, j-1))
         }
         return r
    }
    
    //MARK: - 455.分发饼干
    func startFindContentChildren() {
        print("result: \(findContentChildren([1, 2, 3], [1, 1]))")
    }
    
    func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
        var newG = g
        var newS = s
        var result: Int = 0
        
        newG.sort()
        newS.sort()
        
        var i = 0, j = 0
        
        while i < newG.count && j < newS.count {
            if newG[i] <= newS[j] {
                i += 1
                j += 1
                result += 1
            } else {
                j += 1
            }
        }
        
        return result
    }
    
    //MARK: - 122.买卖股票的最佳时机II
    func startMaxProfit2() {
        print("result: \(maxProfit2([7, 1, 5, 3, 6, 4]))")
    }
    
    func maxProfit2(_ prices: [Int]) -> Int {
        //method1 贪心算法
        guard prices.count > 1 else {
            return 0
        }
        
        var result: Int = 0
        
        for index in 0 ..< prices.count - 1 {
            if prices[index + 1] > prices[index] {
                result += prices[index + 1] - prices[index]
            }
        }
        
        return result
    }
    
    //MARK: - 55.跳跃游戏
    func startCanJump() {
        print("result: \(canJump([2, 3, 1, 1, 4]))")
    }
    
    func canJump(_ nums: [Int]) -> Bool {
        guard nums.count > 1 else {
            return false
        }
        
        var endReachable = nums.count - 1
        var index = endReachable
        while index >= 0 {
            if nums[index] + index >= endReachable {
                endReachable = index
            }
            index -= 1
        }
        
        return endReachable == 0
    }
}
