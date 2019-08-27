//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: 排序
//: 1.冒泡排序
//: 基本思想：从后面开始相邻两个数比较大小，较大的数下沉，较小的数冒起来，最终一轮下来最小的数到了最前面，依次重复。

//: 优化逻辑：当某一轮没有发生位置交换的情况时，证明已经排好序了，可以停止排序。

//stride(from: 3, to: 0, by: -1)
//(3,2,1)
//stride(from: 3, through: 0, by: -1)
//(3,2,1,0)

func bubbleSort(array: [Int]) -> [Int] {
    var arr = array
    //只需要count-1轮排序
    for i in 0..<arr.count-1 {
        //从最后一个到未排好序的第一个
        for j in stride(from: arr.count-1, to: i, by: -1) {
            if arr[j] < arr[j-1] {
                let temp = arr[j]
                arr[j] = arr[j-1]
                arr[j-1] = temp
            }
        }
    }
    return arr
}

bubbleSort(array: [3, 4, 5, 9, 7, 8])



//: 2.选择排序
//: 基本思想：
//在长度为N的无序数组中，第一次遍历n-1个数，找到最小的数值与第一个元素交换；
//第二次遍历n-2个数，找到最小的数值与第二个元素交换；
//。。。
//第n-1次遍历，找到最小的数值与第n-1个元素交换，排序完成。


func selectSort(array: [Int]) -> [Int] {
    var arr = array
    //只需要array.count-1轮
    for i in 0..<array.count-1 {
        //每轮的初始最小索引为i（第1轮：i=0，表示初始最小元素为第一个）
        var minIndex = i
        for j in i..<array.count {
            if array[j] < array[minIndex] {
                //比最小元素小就交换索引
                minIndex = j
            }
        }
        
        let temp = arr[i]
        arr[i] = arr[minIndex]
        arr[minIndex] = temp
    }
    return arr
}

selectSort(array: [0,4,2,6,1])

//: 3.插入排序（扑克插牌）
//: 基本思想：在要排序的一组数中，假定前n-1个数已经排好序，现在将第n个数插到前面的有序数列中，使得这n个数也是排好顺序的。如此反复循环，直到全部排好顺序。
func insertSort(array: [Int]) -> [Int] {
    var arr = array
    for i in 0..<array.count-1 {
        for j in stride(from: i+1, to: 0, by: -1) {
            //由于前面的元素已经是排好序的，如果后面的元素比前一个大（说明不需要交换位置）则比之前的所有元素都大，可以直接返回并进行下一轮排序。
            guard arr[j] < arr[j-1] else { break }
            let temp = arr[j]
            arr[j] = arr[j-1]
            arr[j-1] = temp
        }
    }
    
    return arr
}


//: 4.快速排序

//: 4.1 常规排序方式（左右哨兵）
//: 基本思想：
//1.先从数列中取出一个数作为key值；
//2.将比这个数小的数全部放在它的左边，大于或等于它的数全部放在它的右边；
//3.对左右两个小数列重复第二步，直至各区间只有1个数。
func quicklySort(array: inout [Int], left: Int, right: Int) {
    if right > left {
        
        var i = left
        var j = right
        let temp = array[left]
        
        while j > i {
            //从右往左找比基数小的数下标
            while j > i && array[j] >= temp  {
                j -= 1
            }
            //从左往右找比基数大的数下标
            while j > i && array[i] <= temp  {
                i += 1
            }
            //换位
            if j > i {
                let t = array[i]
                array[i] = array[j]
                array[j] = t
            }
        }
        
        //一轮完成后，交换相遇点的数和参考基数
        //注意和前面temp获取位置（left）保持一致
        print("(\(i)/,\(j))")
        array[left] = array[i]
        array[i] = temp
        
        quicklySort(array: &array, left: left, right: i-1)
        quicklySort(array: &array, left: i+1, right: right)
    }
}

var array = [0,3,5,2,0,102,45,23]
quicklySort(array: &array, left: 0, right:array.count-1)

//: 4.3 排序分离

func partitionLomuto<T: Comparable>(_ a: inout [T], low: Int, high: Int) -> Int {
    let pivot = a[high]

    var i = low
    for j in low..<high {
        if a[j] <= pivot {
            (a[i], a[j]) = (a[j], a[i])
            i += 1
        }
    }
    
    (a[i], a[high]) = (a[high], a[i])
    return i
}

func quicksortLomuto<T: Comparable>(_ a: inout [T], low: Int, high: Int) {
    if low < high {
        let p = partitionLomuto(&a, low: low, high: high)
        quicksortLomuto(&a, low: low, high: p - 1)
        quicksortLomuto(&a, low: p + 1, high: high)
    }
}

var array2 = [0,3,5,2,0,102,45,23]
quicksortLomuto(&array2, low: 0, high: array.count-1)

//: 4.3 同侧哨兵遍历

//核心思想：
//1.每次取最后一个数作为需要快排归位的数pivot。
//2.哨兵j从左到右在区间内遍历，有比pivot小的数就和哨兵i交换并且i进1位。
//https://blog.csdn.net/weixin_33755554/article/details/87633892

func quicklySort3<T: Comparable>(_ a: inout [T], low: Int, high: Int) {
    
    if low < high {
        let pivot = a[high]
        var i = low
        for j in low..<high {
            if a[j] <= pivot {
                (a[i], a[j]) = (a[j], a[i])
                i += 1
            }
        }
        (a[i], a[high]) = (a[high], a[i])
        quicklySort3(&a, low: low, high: i-1)
        quicklySort3(&a, low: i+1, high: high)
    }

}

var array3 = [0,3,5,2,0,102,45,23]
quicklySort3(&array3, low: 0, high: array3.count-1)



//: [Next](@next)
