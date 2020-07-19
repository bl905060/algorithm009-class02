//
//  Week_09.swift
//  Algorithm
//
//  Created by Leibi on 2020/7/19.
//  Copyright © 2020 Leibi. All rights reserved.
//

import Foundation

class Geek09 {
    
}

extension Geek09 {
    //MARK: - 387. 字符串中的第一个唯一字符
    func firstUniqChar(_ s: String) -> Int {
        var set = Set<Character>()
        var index = 0
        for char in s {
            if !set.contains(char) {
                set.insert(char)
                if s.lastIndex(of: char)! == s.index(s.startIndex, offsetBy: index) {
                    return index
                }
            }
            index += 1
        }
        return -1
    }
    
    //MARK: - 32. 最长有效括号
    func longestValidParentheses(_ s: String) -> Int {
        var maxn = 0, str = Array(s)
        var table = [Int](repeating: 0, count: str.count)
        for i in 0..<str.count {
            if str[i] == ")" && i > 0 && i - table[i - 1] > 0 && str[i - table[i - 1] - 1] == "(" {
                table[i] = table[i - 1] + 2 + ((i - table[i - 1]) >= 2 ? table[i - table[i - 1] - 2] : 0);
                maxn = max(maxn, table[i]);
            }
        }
        return maxn
    }
}
