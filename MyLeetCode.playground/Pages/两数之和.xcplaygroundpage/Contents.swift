/*
 给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。
 你可以假设每种输入只会对应一个答案。但是，你不能重复利用这个数组中同样的元素。

 示例:
 给定 nums = [2, 7, 11, 15], target = 9
 因为 nums[0] + nums[1] = 2 + 7 = 9
 所以返回 [0, 1]
*/

//: [Previous](@previous)

import Foundation

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var targetIndex1 = -1
        var targetIndex2 = -1
        
        for (index1, item) in nums.enumerated() {
            let value1 = item
            
            for index2 in (index1+1)..<nums.count {
                let value2 = nums[index2]
                
                let sumValue = value1 + value2
                if sumValue == target {
                    targetIndex1 = index1
                    targetIndex2 = index2
                    break
                }
            }
            
            if targetIndex1 >= 0 && targetIndex2 >= 0 {
                break
            }
        }
                
        if targetIndex1 >= 0 && targetIndex2 >= 0 {
            return [targetIndex1, targetIndex2]
        }
        
        return []
    }
}

let nums = [2, 7, 11, 15]
let target = 9
let result = Solution().twoSum(nums, target)

if result.count > 1 {
    print("targetIndex1 = \(result[0]), targetIndex2 = \(result[1])")
} else {
    print("result = null")
}

//: [Next](@next)
