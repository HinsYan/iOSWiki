import UIKit
import PlaygroundSupport

/*:闭包特点
 1.闭包可以捕获和存储其所在上下文中任意常量和变量的引用，被称为包裹常量和变量。
 2.Swift会为你管理在捕获过程中涉及到的所有内存操作。
 */

/*:闭包表达式
 { (parameters) -> return type in
 statements
 }
 
 闭包简化：
 利用上下文推断参数和返回值类型
 隐式返回单表达式闭包，即单表达式闭包可以省略 return 关键字
 参数名称缩写
 尾随闭包语法
 */

let numbersArray = [1,4,5,7,9,3,2]
let sortedNumbers = numbersArray.sorted { (a, b) -> Bool in
    return a > b
}

//:闭包内的值捕获
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

//:创建了另一个 incrementer，它会有属于自己的引用，指向一个全新、独立的 runningTotal 变量。
let incrementByTen = makeIncrementer(forIncrement: 10)
let incrementBySeven = makeIncrementer(forIncrement: 7)

incrementByTen()
incrementByTen()
incrementBySeven
incrementBySeven

//:再次调用原来的 incrementByTen 会继续增加它自己的 runningTotal 变量，该变量和 incrementBySeven中捕获的变量没有任何联系
incrementByTen()

//:如果你将闭包赋值给一个类实例的属性，并且该闭包通过访问该实例或其成员而捕获了该实例，你将在闭包和该实例间创建一个循环强引用。Swift 使用捕获列表来打破这种循环强引用。

//:闭包是引用类型
let alsoIncrementByTen = incrementByTen
//值为40
alsoIncrementByTen()

/*:逃逸闭包

 定义：当一个闭包作为参数传到一个函数中，但是这个闭包在函数返回之后才被执行，我们称该闭包从函数中逃逸。
 注意：
 1.将一个闭包标记为 @escaping 意味着你必须在闭包中显式地引用 self
 2.非逃逸闭包和逃逸闭包讲的不是执行先后顺序吧,非逃逸是指你的闭包不能在函数外单独调用,只能在函数内部调用,函数调用完成后,那个闭包也就结束了。
 
 */

//声明一个存放函数的数组
var functionArray: [() -> Void] = []
//定义一个接收闭包参数的函数，如果定义非逃逸函数 func doSomething(@noescape paramClosure:() -> Void) 就会编译错误
func doSomething(paramClosure: @escaping () -> Void) {
    //把参数放入数组中，用于逃逸调用
    functionArray.append(paramClosure)
    
}
//调用函数
doSomething { print("Hello one") }
doSomething { print("Hello two") }

//逃逸调用闭包
for closurePrama in functionArray {
    closurePrama()
}

/*:自动闭包
 1.包装传递给函数作为参数的表达式，把一个表达式直接自动闭合一个闭包
 2.优化性能
 */
func sendRequest(argc1: String, arc2: String, completionHandle: @autoclosure () -> Bool) {
    if completionHandle() {
        print(argc1, arc2)
    }
}
sendRequest(argc1: "5", arc2: "6", completionHandle: true)
