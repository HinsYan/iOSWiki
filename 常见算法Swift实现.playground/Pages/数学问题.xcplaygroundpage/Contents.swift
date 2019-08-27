//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

//: 数学问题实现
//: Question1：实现翡波那契数列
//: 描述：要求输入一个整数n，请你输出斐波那契数列的第n项（从0开始，第0项为0，n<=39）

//: 翡波那契数学表示参考【 F(1)=1，F(2)=1, F(n)=F(n-1)+F(n-2)（n>=3，n∈N*）】

//时间复杂度最高
func fibonacci1(n: Int) -> Int {
    guard n >= 0 && n <= 39 else { return 0 }
    guard n != 0 && n != 1 else { return n }
    return fibonacci1(n: n-1) + fibonacci1(n: n-2)
}
//时间复杂度较低（最优是通过矩阵的思想求解）

//重点在于使用每次循环计算时，记录下前面2项的值，交给下一个循环
func fibonacci2(n: Int) -> Int {
    guard n >= 0 && n <= 39 else { return 0 }
    guard n != 0 && n != 1 else { return n }
    
    var fn = 0
    var fnOne = 0
    var fnTwo = 1
    //每次循环计算时，记录下前面2项的值，交给下一个循环
    for _ in 2...n {
        fn = fnOne + fnTwo
        fnOne = fnTwo
        fnTwo = fn
    }
    return fn
}
print(fibonacci1(n: 55))
print(fibonacci2(n: 55))

//: Question2：二分查找相关
//: 描述：在一个二维数组中（每个一维数组的长度相同），每一行都按照从左到右递增的顺序排序，每一列都按照从上到下递增的顺序排序。请完成一个函数，输入这样的一个二维数组和一个整数，判断数组中是否含有该整数。

//: 二分查找思路

//1.获取数组初始左右边界（0...数组Count-1）
//2.递归查找，确定结束条件：位左边界<=右边界
//3.讨论中间量和value大小关系：等于则找到并返回，大于则右边界变为中界-1，小于则左边界变为中界+1
//4.返回未找到
func binarySearchin(array: [Int], value: Int) -> Bool {
    
    var leftIndex = 0
    var rightIndex = array.count-1
    //如果需要插入
    //var newArray = array

    while leftIndex <= rightIndex {
        
        let midIndex = (leftIndex+rightIndex)/2
        let midValue = array[midIndex]

        guard midValue != value else {
            //刚好找到并插入
            //newArray.insert(value, at: leftIndex)
            return true
        }
        
        if midValue > value {
            rightIndex = midIndex-1
        } else {
            leftIndex = midIndex+1
        }
    }

    //未找到但是确定了范围，可以从左边插入
    //newArray.insert(value, at: leftIndex)
    //print(newArray)
    return false
}

binarySearchin(array: [0,3,4,6], value: -1)

//: 使用二分查找遍历
func findValueIn(array2D:[[Int]], value: Int) -> Bool {
    for array in array2D {
        if binarySearchin(array: array, value: value) {
            return true
        }
    }
    return false
}

findValueIn(array2D: [[1,2,3,4],[5,6,7,8],[9,10,11,13],[14,15,16,17]], value: 9)

//: Question3：素数的判断
//: 描述：判断一个数是否为素数

//: 素数判断思路
//1.遍历取余不为0就是素数
//2.遍历的优化：假如n不是质数，必然存在非1的两个约数p1和p2，其中p1<=sqrt(n)，p2>=sqrt(n)，所以遍历的边界条件可以缩小。
func isPrime(value: Int) -> Bool {

    let sqrtInt = Int(sqrt(Double(value)))
    guard sqrtInt >= 2 else { return true }
    
    for index in 2...sqrtInt {
        if value % index == 0 {
            return false
        }
    }
    return true
}

isPrime(value: 0)

//: 找出特定范围内的素数
func countPrimeIn(value: Int) -> [Int] {
    var array = [Int]()
    for index in 2...value {
        if isPrime(value: index) {
            array.append(index)
        }
    }
    return array
}

countPrimeIn(value: 100)


//: Question3：丑数
//: 描述：我们把只包含质因子2，3和5的数为丑数，编写一个函数判断一个数是否为丑数。通常把1当作丑数，输入的范围为32位有符号整数。

//: 判断丑数思路

//1.先循环把质因子2剔除，再循环把质因子3剔除，循环把质因子5剔除
//2.最后判断结果为1则是丑数、否则不是
func isUglyNumber(value: Int) -> Bool {
    
    var number = value

    while number % 2 == 0 {
        number = number/2
    }
    while number % 3 == 0 {
        number = number/3
    }
    while number % 5 == 0 {
        number = number/5
    }
    
    if number == 1 {
        return true
    } else {
        return false
    }
}

isUglyNumber(value: 10)

//: 丑数生成思路

//对于一个丑数p，p*2、p*3、p*5都是丑数。
//那么从第一个丑数1开始，1*2、1*3、1*5都是丑数，最小的2是第二个丑数；
//对于第二个丑数2来说，又多出来三个需要被比较的数字，即2*2、2*3、2*5，再加上第一轮挑剩下的1*3、1*5，但是这里显然可以看出来，1*3<2*3，1*5<2*5，所以其实只需要比较2*2、1*3、1*5即可。
//依次重复比较
func findUglyNumber(n: Int) -> [Int] {
    var arrayUgly = [1]
    
    var factor2 = 0
    var factor3 = 0
    var factor5 = 0
    
    for index in 1..<n {
        
        let uglyNext = min(arrayUgly[factor2]*2, arrayUgly[factor3]*3, arrayUgly[factor5]*5)
        arrayUgly.append(uglyNext)
        
        if uglyNext == arrayUgly[factor2]*2 {
            factor2 += 1
        }
        if uglyNext == arrayUgly[factor3]*3 {
            factor3 += 1
        }
        if uglyNext == arrayUgly[factor5]*5 {
            factor5 += 1
        }

    }
    return arrayUgly
}

let ugly100 = findUglyNumber(n: 10)

//: Question4：判断一个整数是否是2的次幂
//: 思路
//1.能否被2整除，能的话就除以2再循环遍历，直到=1，则满足条件。
func isPowerFor2(value: Int) -> Bool {

    var number = value
    guard number != 1 else {
        return true
    }
    
    while number%2 == 0 {
        number /= 2
    }
    
    return number == 1
    
    //return false
}

isPowerFor2(value: 7)
