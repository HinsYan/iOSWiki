//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//不用reversed()，数组实现字符反转
func charReverse(str: inout String) {
    var head = str.startIndex
    //Swift的endIndex表示字符串最后一个字符后边的index，而不是最后一个字符的index
    //Swift字符串insert的位置是向index的前面插入
    var tail = str.index(before: str.endIndex)

    while head < tail {
        let tempHead = str[head]
        let tempTail = str[tail]
        
        str.remove(at: head)
        str.insert(tempTail, at: head)
        str.remove(at: tail)
        str.insert(tempHead, at: tail)
        
        head = str.index(after: head)
        tail = str.index(before: tail)
    }
}

charReverse(str: &str)

//合并2个有序数组
func mergeSortedArray(array1: [Int], array2: [Int]) -> [Int] {
    var result = [Int]()
    var p1 = 0, p2 = 0
    
    //任意一个数组遍历到末尾都退出遍历
    while p1 < array1.count && p2 < array2.count {
        if array1[p1] < array2[p2] {
            result.append(array1[p1])
            p1 += 1
        } else {
            result.append(array2[p2])
            p2 += 1
        }
    }
    //如果array1有剩余
    while p1 < array1.count {
        result.append(array1[p1])
        p1 += 1
    }

    //如果array2有剩余
    while p2 < array2.count {
        result.append(array2[p2])
        p2 += 1
    }
    return result

}

let array1 = [3,4,5,7,9]
let array2 = [1,2,3,6,7,14,23,26]

print(mergeSortedArray(array1: array1, array2: array2))


//字符串中第一个只出现一次的字符

// 利用hash表存, key 存每个字符 value 存每个字符对应的个数
// 第一次 存 key 和value
// 第二次遍历字符. 判断 map 内第一个count 为 1 的就是结果
func findFirstCharOnlyOnce(from string: String) -> String {
    guard string.count > 0 else {
        return ""
    }
    var result = ""
    var map = [Character: Int]()
    for char in string {
        if let count = map[char], count > 0 {
            map[char] = count + 1
        }else {
            map[char] = 1
        }
    }
    for char in string {
        if let count = map[char], count == 1 {
            result = String(char)
            return result
        }
    }
    return result
}

findFirstCharOnlyOnce(from: "amazing")

/*
 给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。
 说明：你的算法应该具有线性时间复杂度。 你可以不使用额外空间来实现吗？
 输入: [4,1,2,1,2]
 输出: 4
 */
func singleNumber(_ nums: [Int]) -> Int {
    //位运算符。位异或 ( ^ )相同为0,不同为1
    var result = 0
    for num in nums {
        result = result ^ num //或者 result ^= num
    }
    return result
}


//: [Next](@next)
