/*
给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。

示例 1:
输入: "abcabcbb"
输出: 3
解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。

示例 2:
输入: "bbbbb"
输出: 1
解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。

示例 3:
输入: "pwwkew"
输出: 3
解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。

链接：https://leetcode-cn.com/problems/longest-substring-without-repeating-characters
*/


//: [Previous](@previous)

import Foundation

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var finalResultStr: String?
        
        let charCount = s.count
        for firstCharStartLocation in 0..<charCount {
            var resultStr: String?
            
            for i in firstCharStartLocation..<charCount {
                // 获取子串
                let fromIndex = s.index(s.startIndex, offsetBy: firstCharStartLocation)
                let toIndex = s.index(s.startIndex, offsetBy: charCount-i+firstCharStartLocation)
                
                let subStr = String(s[fromIndex..<toIndex])
                
//                print("subStr = \(subStr)")
                
                // 遍历子串中的所有字符
                var isRepeat = false
                var charSet = Set<Character>()
                for char in subStr {
                    if !charSet.contains(char) {
                        charSet.insert(char)
//                        print("\(char)")
                    } else {
                        isRepeat = true
                        break
                    }
                }
                
                if !isRepeat {
                    resultStr = subStr
//                    print("resultStr = \(resultStr!)")
                    break
                }
            }
            
            if nil != resultStr && resultStr!.count > 0 {
                if nil == finalResultStr
                || finalResultStr!.count < resultStr!.count {
                    finalResultStr = resultStr
                }
            }
        }
        
        if nil == finalResultStr || 0 == finalResultStr?.count {
            return 0
        }
        
//        print("final resultStr = \(finalResultStr!)")
        return finalResultStr!.count
    }
}

let count = Solution().lengthOfLongestSubstring("rrqqnboidcietehzgazxzqycqlkbqqbjiuzvvpfarognspmbqoargytwjfxaxblfvldscivuybhrrvujjuartvoecngzoshjfke")
print("final result count = \(count)")

//: [Next](@next)


