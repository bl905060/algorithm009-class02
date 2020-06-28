//
//  Week_06.swift
//  Algorithm
//
//  Created by Leibi on 2020/6/28.
//  Copyright © 2020 Leibi. All rights reserved.
//

import Foundation

class Geek06 {
    
}

extension Geek06 {
    //MARK: - 64.最小路径和
    func minPathSum(_ grid: [[Int]]) -> Int {
        let rows = grid.count
        let cols = grid[0].count
        var f = [[Int]](repeating: [Int](repeating: 0, count: cols), count: rows)
        
        f[0][0] = grid[0][0]

        for i in 1..<rows{
            f[i][0] = f[i-1][0] + grid[i][0]
        }
        for j in 1..<cols{
            f[0][j] = f[0][j-1] + grid[0][j]
        }

        for i in 1..<rows{
            for j in 1..<cols{
                f[i][j] = min(f[i-1][j], f[i][j-1]) + grid[i][j]
            }
        }
        return f[rows-1][cols-1]
    }
    
    //MARK: - 91. 解码方法
    func numDecodings(_ s: String) -> Int {
        let str = Array(s)
        let len = str.count
        if len < 1 {
            return 0
        }
        if len == 1 {
            return str[0] == "0" ? 0 : 1
        }
        var dp = Array(repeating: 0, count: len + 1)
        dp[0] = 1
        dp[1] = str[0] == "0" ? 0 : 1
        for i in 2 ..< len + 1 {
            var last = Int("\(str[i - 1])")!
            if last > 0 {
                dp[i] += dp[i - 1]
            }
            last = Int("\(str[i - 2])\(str[i - 1])")!
            
            if last >= 10 && last <= 26 {
                dp[i] += dp[i - 2]
            }
        }
        return dp[len]
    }
}
