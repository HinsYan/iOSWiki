//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: 单链表
public class Node {
    var value: Int
    var next: Node?

    init(value: Int) {
        self.value = value
    }
    
    func printNodes() {
        var p:Node? = self
        while p != nil {
            print(p!.value)
            p = p!.next
        }
    }
}

//: 1.1判断单链表是否有环
//: 参考：https://blog.csdn.net/doufei_ccst/article/details/10578315
//: 核心思想：快慢指针，用2个指针一块一慢，开始时都指向表头，然后slow指针走一步，fast指针走2步，如果有环，fast一定会先进入环，而slow后进入环，经过一定步的操作之后二者一定能够在环上相遇。
//: 特点：相遇时slow还没有绕环一圈，也就是说一定是在slow走完第一圈之前相遇

func checkListCircle(head: Node) -> Bool {
    var slow: Node? = head
    var fast: Node? = head

    //当节点不为空时一直循环
    while slow != nil && fast != nil {
        slow = slow?.next
        fast = fast?.next?.next
        if slow === fast {
            return true
        }
    }

    return false
}

let a = Node(value: 0)
let b = Node(value: 1)
let c = Node(value: 2)
let d = Node(value: 3)
let e = Node(value: 4)
let f = Node(value: 5)

a.next = b
b.next = c
c.next = d
d.next = e
e.next = f
f.next = b

checkListCircle(head: a)

//: 1.2判断单链表是否有环，有环则找出环行单链表的入口点。
//: 规律：链表起点head开始到入口点的距离a,与从slow和fast的相遇点到入口点的距离相等。
//: 核心思想：分别用一个指针（p1, p2），同时从head与slow和fast的相遇点出发，每一次操作走一步，直到p1 == p2，此时的位置也就是入口点！

func findListCircleHead(head: Node) -> Node? {
    var slow: Node? = head
    var fast: Node? = head
    
    //当节点不为空时一直循环
    while slow != nil && fast != nil {
        slow = slow?.next
        fast = fast?.next?.next
        //有环相遇
        if slow === fast {
            var p1 = head
            var p2 = slow!
            //入口点相遇
            while p1 !== p2 {
                p1 = p1.next!
                p2 = p2.next!
            }
            return p1
        }
    }
    return nil
}

if let circleBeginNode = findListCircleHead(head: a) {
    print(circleBeginNode.value)
}


//: 1.3判断单链表是否有环，有环则返回环的上节点的个数
//: 规律：链表起点head开始到入口点的距离a,与从slow和fast的相遇点到入口点的距离相等。
//: 核心思想：分别用一个指针（p1, p2），同时从head与slow和fast的相遇点出发，每一次操作走一步，直到p1 == p2，此时的位置也就是入口点！

func findListCircleNodeCount(head: Node) -> Int? {
    var slow: Node? = head
    var fast: Node? = head
    
    //当节点不为空时一直循环
    while slow != nil && fast != nil {
        slow = slow?.next
        fast = fast?.next?.next
        if slow === fast {
            //快慢指针再次走一圈
            var countMode = 0
            while true {
                slow = slow?.next
                fast = fast?.next?.next
                countMode += 1
                if slow === fast {
                    break
                }
            }
            return countMode
        }
    }
    
    return nil
}


if let circleNodeCount = findListCircleNodeCount(head: a) {
    print(circleNodeCount)
}


//: 2. 判断2个无环单链表是否相交，相交则找出交点
//: 解法1 ：把其中一个链表的首尾相连，转化为对另一个链表求1.2中的问题
//: 解法2 ：先求出2个链表的长度差n，让长的那个从头节点先走n步，之后同时每次走1步，最后相遇点就是交点
func findListsIntersectionNode(headA: Node, headB: Node) -> Node? {
    
    var trailNode = headA
    while trailNode.next != nil {
        trailNode = trailNode.next!
    }
    //连接
    trailNode.next = headA
    let circleNode = findListCircleHead(head: headB)
    //断开连接
    trailNode.next = nil
    
    return circleNode
    
}

let a1 = Node(value: 0)
let a2 = Node(value: 1)
let b1 = Node(value: 2)
let b2 = Node(value: 3)
let b3 = Node(value: 4)
let c1 = Node(value: 5)
let c2 = Node(value: 6)
let c3 = Node(value: 7)

a1.next = a2
a2.next = c1

b1.next = b2
b2.next = b3
b3.next = c1

c1.next = c2
c2.next = c3

if let intersectionNode = findListsIntersectionNode(headA: a1, headB: b1) {
    print(intersectionNode.value)
}

//: 3. 反转单链表
//: input: 1->2->3->4->5->NULL
//: output: 5->4->3->2->1->NULL
//: 核心思想：把nil当成上一个节点（preNode），从首节点依次遍历改变指向为上一个节点

func reverseList(head: Node) {
    var currentNode: Node? = head
    var preNode:Node? = nil
    //交换指向
    while currentNode != nil {
        let nextNode = currentNode!.next
        currentNode!.next = preNode
        preNode = currentNode
        currentNode = nextNode
    }
}

//reverseList(head: c1)
print(c3.next?.next?.value)

//: 4. 合并2个有序单链表
//: Input: 1->2->4, 1->3->4
//: Output: 1->1->2->3->4->4
//: 核心思想：有序数组合并（递归）

func mergeSortedList(headA: Node?, headB: Node?) -> Node? {
    guard headA != nil else { return headB }
    guard headB != nil else { return headA }

    var newHead: Node!

    if headA!.value <= headB!.value {
        newHead = headA
        newHead.next = mergeSortedList(headA: headA?.next, headB: headB)
    } else {
        newHead = headB
        newHead.next = mergeSortedList(headA: headB?.next, headB: headA)
    }
    
    return newHead
}

let a10 = Node(value: 11)
let a11 = Node(value: 17)
let a12 = Node(value: 19)
let a13 = Node(value: 40)
let b10 = Node(value: 9)
let b11 = Node(value: 19)
let b12 = Node(value: 20)
let b13 = Node(value: 45)
let b14 = Node(value: 70)


a10.next = a11
a11.next = a12
a12.next = a13

b10.next = b11
b11.next = b12
b12.next = b13
b13.next = b14

var headMerge = mergeSortedList(headA: a10, headB: b10)
print("4: 合并后的链表----------------------")
while headMerge != nil {
    print(headMerge!.value)
    headMerge = headMerge?.next
}

//: 5. 找到链表的倒数第n个节点
//: 核心思想：2个指针，分2次走
//  情况1. p1先走n步，再和p2同步走，最后p1到达最后一个节点时，p2刚好在倒数第n个点的前一个节点上。
//  情况2. p1先走n-1步，再和p2同步走，最后p1到达最后一个节点时，p2刚好在倒数第n那个点上
// 【情况1适用于删除倒数第n个节点，情况2适用于找到倒数第n个节点】

func findKeyNodeFromEnd(head: Node, n: Int) -> Node? {
    guard n > 0 else {
        return nil
    }
    var p1: Node? = head
    var p2: Node? = head
    //p1先走n-1步，再和p2同步走，最后p1到达最后一个节点时，p2刚好在倒数那个点上
    for _ in 0..<n-1 {
        p1 = p1?.next
    }
    //如果p1走了n-1步后为nil,说明越界了
    if p1 == nil {
        return nil
    }
    // p1和p2同步走，直到p1是最后一个节点退出循环
    while p1?.next != nil {
        p1 = p1?.next
        p2 = p2?.next
    }
    //当p1走到最后一个节点时，p2就位于要找的点
    return p2
}

let a50 = Node(value: 0)
let a51 = Node(value: 40)
let a52 = Node(value: 40)
let a53 = Node(value: 0)
let a54 = Node(value: 40)
let a55 = Node(value: 51)
let a56 = Node(value: 40)

a50.next = a51
a51.next = a52
a52.next = a53
a53.next = a54
a54.next = a55
a55.next = a56

print("5. 找倒数节点--------------------------")
print(findKeyNodeFromEnd(head: a50, n: 20)?.value)

//: 6 倒序处理链表
//: 核心思想：递归倒序处理
func reverseHandler(head: Node?) {
    let p = head
    if p != nil {
        reverseHandler(head: p!.next)
        //打印处理
        print(p!.value)
    }
}

print("6. 倒序打印链表-----------------------")
reverseHandler(head: a50)

//: 7.1 删除链表内倒数第n个节点
// Input: 1->2->3->4->5, and n = 2.
// Output:  1->2->3->5.
//: 核心思想：2个指针，分2次走
//  情况1. p1先走n步，再和p2同步走，最后p1到达最后一个节点时，p2刚好在倒数第n个点的前一个节点上。
//  情况2. p1先走n-1步，再和p2同步走，最后p1到达最后一个节点时，p2刚好在倒数第n那个点上
// 【情况1适用于删除倒数第n个节点，情况2适用于找到倒数第n个节点】

func deleNodeFromEnd(head: Node, n: Int) -> Node? {
    var p1: Node? = head
    var p2: Node? = head
    //p1先走n步，再和p2同步走，最后p1到达最后一个节点时，p2刚好在倒数那个点前一个点上
    for _ in 0..<n {
        p1 = p1?.next
    }
    //如果p1走了n步后为nil,说明倒数第n个,就是第一个直接返回下一个head.next
    if p1 == nil {
        return head.next
    }
    // p1和p2同步走，直到p1是最后一个节点退出循环
    while p1?.next != nil {
        p1 = p1?.next
        p2 = p2?.next
    }
    //当p1走到最后一个节点时，p2位于要删除节点的前一个节点，直接删除下一个节点
    p2?.next = p2?.next?.next
    return head
}

print("7.1 删除倒数第n个节点的链表：----------------")
deleNodeFromEnd(head: a50, n: 4)?.printNodes()

//: 7.1 删除链表内第n个节点
// Input: 1->2->3->4->5, and n = 2.
// Output:  1->3->4->5.
//: 核心思想：一个指针从头开始走n-2步后，刚好停在要删除节点的前一个节点上
func deleNodeFromHead(head: Node, n: Int) -> Node? {
    if n == 0 { return nil }
    if n == 1 { return head.next }
    
    var p: Node? = head
    for _ in 0..<n-2 {
        p = p?.next
    }
    
    p?.next = p?.next?.next
    return head
}

print("7.2 删除第n个节点的链表：----------------")
deleNodeFromHead(head: a50, n: 2)?.printNodes()


//: 8. 删除链表中等于给定值 val 的所有节点
//示例 1:
//输入: 1->2->3->3->4->4->5，val = 1
//输出:2->3->3->4->4->5
//
//示例 2:
//输入: 1->1->1->2->3，val = 2
//输出: 1->1->1->3

func deleNodeValueOf(head: Node, val: Int) -> Node? {
    let dummy = Node(value: 0)
    dummy.next = head
    var node = dummy
    
    while node.next != nil {
        if node.next!.value == val {
            node.next = node.next!.next
        } else {
            node = node.next!
        }
    }
    
    return dummy.next
}

print("8 删除链表中等于给定值val的所有节点：----------------")
deleNodeValueOf(head: a50, val: 40)?.printNodes()


//: 9. 删除已排好序链表中值重复的节点(去重)
//: Input: 1->1->2->3->3
//: Output: 1->2->3
func deleteDuplicates1(head: Node) -> Node? {
    var curt = head
    while curt.next != nil {
        if curt.next!.value == curt.value {
            curt.next = curt.next!.next
        } else {
            curt = curt.next!
        }
    }
    
    return head
}

//print("9 删除已排好序链表中值重复的节点(去重)：----------------")
//deleteDuplicates1(head: a50)?.printNodes()

//: 10. 删除已排好序链表中值重复的节点（重复的都删除）
//Input: 1->2->3->3->4->4->5
//Output: 1->2->5
func deleteDuplicates2(head: Node) -> Node? {
    if head.next == nil {
        return head
    }
    
    let dummy = Node(value: 0)
    dummy.next = head
    var node = dummy
    
    while node.next != nil && node.next!.next != nil {
        if node.next!.value == node.next!.next!.value {
            let val = node.next!.value
            while node.next != nil && node.next!.value == val {
                node.next = node.next!.next
            }
        } else {
            node = node.next!
        }
    }
    
    return dummy.next
}
print("10. 删除已排好序链表中值重复的节点（重复的都删除）: ----------------")
deleteDuplicates2(head: a50)?.printNodes()




//: [Next](@next)

