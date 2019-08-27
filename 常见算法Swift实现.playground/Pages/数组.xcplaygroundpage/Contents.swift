//: [Previous](@previous)

import Foundation

var str = "Hello, playground"


//: 1.1数组中只出现过一次的数字
//: Input: [4,1,2,1,2]
//: Output: 4
//: 描述: 给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。
//: 核心思想：利用异或运算^，任何数异或0等于该数本身,两个相同的数异或等于0(抵消)
/*:
 
 nums = [2,3,4,3,2]的执行结果如下：
 第一次循环:
 0 ^ 2 = 2
 二进制：0 + 10 = 10
 第二次循环:
 2 ^ 3 = 1
 二进制：10 + 11 = 1
 第三次循环:
 1 ^ 4 = 5
 二进制：1 + 100 = 101
 第四次循环:
 5 ^ 3 = 6
 二进制：101 + 11 = 110
 第五次循环:
 6 ^ 2 = 4
 二进制：110 + 10 = 100
 
 */
func singleNumber(_ nums: [Int]) -> Int {
    var singleNum = 0
    for num in nums {
        singleNum = singleNum ^ num
    }
    return singleNum
}

//: 1.2求数组中出现次数超过一半的数字
//: Input: [4,1,2,1,1]
//: Output: 1

//: 核心思想：该算法只针对肯定存在这个数字的时候有效。如果不明确是否存在的话，遍历到结束后需要再统计一下出现次数是否真的大于一半。

//在遍历数组的时候保存两个值：num（用来保存数组中遍历到的某个数字）和count（用来表示当前数字的出现次数），count初始化为1。当我们遍历到数组中下一个数字的时候：
//
//1.如果下一个数字与之前num保存的数字相同，则count加1；
//2.如果下一个数字与之前num保存的数字不同，则count减1；
//3.每当出现次数count变为0后，用num保存下一个数字，并把count重新设为1。 直到遍历完数组中的所有数字为止。

func moreHalfNumber(data: [Int]) -> Int {
    var num = 0
    var count = 0
    for i in 0..<data.count {
    
        guard count != 0 else {
            num = data[i]
            count = 1
            continue
        }
        
        if num == data[i] {
            count += 1
        } else {
            count -= 1
        }
    }
    return num
}

moreHalfNumber(data: [0,1,1,6,1,6,1,6,1,1,1])


//: 1.3将所有的0移动到数组末尾

/*: 描述
给定一个数组 nums, 编写一个函数将所有 0 移动到它的末尾，同时保持非零元素的相对顺序。

例如， 定义 nums = [0, 1, 0, 3, 12]，调用函数之后， nums 应为 [1, 3, 12, 0, 0]。

注意事项:
必须在原数组上操作，不要为一个新数组分配额外空间。
尽量减少操作总数。
*/

//: 核心思想: 用标志位j记录下非0元素应该出现的位置，循环遍历将非0元素交换到对应位置上。
func moveZeroes(_ nums: inout [Int]) {
    let count = nums.count
    var j = 0
    for i in 0..<count {
        if nums[i] != 0 {
            //把i位置元素交换到j位置上
            nums.swapAt(i, j)
            j += 1
        }
    }
}


//: 1.4移除数组中等于某个值的元素
//: 核心思想: 和1.3一致
func removeElement(_ nums: inout[Int], _ value: Int)-> Int {
    var res:Int = 0
    for i in 0..<nums.count {
        
        if (nums[i] != value) {
            nums[res]=nums[i]
            res += 1
        }
    }
    return res
    
}
//: 1.5三色旗问题
//: 问题: 在一根绳子上有一些红,白,蓝三种颜色的旗子,现在要把这些旗子按照 蓝,白,红的顺序排序.
//: 要求:旗子只能在绳子上移动,一次只能掉换两个旗子位置

//: Input: [2,0,2,1,1,0]
//: Output: [0,0,1,1,2,2]

//: 核心思想:说简单点,你在绳子上遍历每个绳子的颜色，遇见蓝色的向前放，白色的放中间，红色的向后放。实际遍历过程中，left哨兵位置之前的为蓝色，right之后的为红色，left和p间的为白色。当p遇到right时结束
func sortColor(array: inout [Int]) {
    var left = 0
    var right = array.count-1
    var p = 0
    
    while p <= right {
        let item = array[p]
        switch item {
        case 0:
            array.swapAt(left, p)
            left += 1
            p += 1
        case 1:
            p += 1
        case 2:
            array.swapAt(right, p)
            right -= 1
            //因为是把前面的往后放，所以交换过来的旗子还需要进行遍历，所以这里不要 p+=1
            //p += 1
        default:
            print("没有对应的棋子")
            return
        }
    }
    
}

var arr = [0,1,2,0,1,1,0,2,1,2,0,1]
sortColor(array: &arr)

//: 1.5有序数组内部的两个元素的和为目标值
//: 核心思想: 因为有序，使用类似快排思想，前后依次遍历数组。最前面和最后面2个哨兵相加大于目标值则说明后面的哨兵需要往前移，小于则说明前面的哨兵要往后移。

//: Input: numbers = [2,7,11,15], target = 9
//: Output: [1,2]
//: Explanation: The sum of 2 and 7 is 9. Therefore index1 = 1, index2 = 2.

func itemTwoSumfor(sum: Int, array: [Int]) -> [Int]? {

    var min = 0
    var max = array.count-1
    
    guard array.count >= 2 else {
        return nil
    }
    
    while min < max {
        
        if array[min] + array[max] == sum {
            return [min+1, max+1]
        } else {
            
            if array[min] + array[max] < sum {
                min += 1
            } else {
                max -= 1
            }
        }
    }
    
    return nil
}

itemTwoSumfor(sum: 7, array: [1,2,4,7])


//: [Next](@next)
