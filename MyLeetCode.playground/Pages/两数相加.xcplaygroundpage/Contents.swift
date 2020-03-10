/*
给出两个 非空 的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。
如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。

您可以假设除了数字 0 之外，这两个数都不会以 0 开头。

示例：
输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
输出：7 -> 0 -> 8
原因：342 + 465 = 807

链接：https://leetcode-cn.com/problems/add-two-numbers
*/

//: [Previous](@previous)

import Foundation

// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var resultListNode: ListNode?
        var resultListNodeFirst: ListNode?
        var lastDividerNum = 0
        
        var targetList1Node: ListNode? = l1
        var targetList2Node: ListNode? = l2
        while (true) {
            if nil == targetList1Node
                && nil == targetList2Node
                && 0 == lastDividerNum {
                break
            }
            
            let value1 = ((nil == targetList1Node) ? 0 : targetList1Node!.val)
            let value2 = ((nil == targetList2Node) ? 0 : targetList2Node!.val)
            
            let sum = value1 + value2 + lastDividerNum
            let otherNum = sum % 10
            
            if nil == resultListNode {
                resultListNode = ListNode(otherNum)
                resultListNodeFirst = resultListNode
            } else {
                resultListNode!.next = ListNode(otherNum)
                resultListNode = resultListNode?.next
            }
            
            lastDividerNum = sum / 10
            
            targetList1Node = targetList1Node?.next
            targetList2Node = targetList2Node?.next
        }
        
        return resultListNodeFirst
    }
}

let list1Node1 = ListNode(2)
let list1Node2 = ListNode(4)
let list1Node3 = ListNode(3)

list1Node1.next = list1Node2
list1Node2.next = list1Node3

let list2Node1 = ListNode(5)
let list2Node2 = ListNode(6)
let list2Node3 = ListNode(4)

list2Node1.next = list2Node2
list2Node2.next = list2Node3

var resultListNode = Solution().addTwoNumbers(list1Node1, list2Node1)
if nil != resultListNode {
    while true {
        let value = resultListNode!.val
        print("value = \(value)")
        
        resultListNode = resultListNode?.next
        if nil == resultListNode {
            break
        }
    }
} else {
    print("resultListNode is nil")
}

//: [Next](@next)

