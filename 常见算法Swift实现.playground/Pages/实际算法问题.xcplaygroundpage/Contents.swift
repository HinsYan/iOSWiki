//: [Previous](@previous)

import Foundation
import UIKit

var str = "Hello, playground"


let rootView = UIView()
let view1 = UIView()
let view2 = UIView()

let view3 = UIView()
let view4 = UIView()
let view5 = UIView()

rootView.addSubview(view1)
rootView.addSubview(view2)

view1.addSubview(view3)

view2.addSubview(view4)
view2.addSubview(view5)

let button1 = UIButton()
let button2 = UIButton()
let button3 = UIButton()
let button4 = UIButton()
let button5 = UIButton()
let button6 = UIButton()
let button7 = UIButton()
let button8 = UIButton()

rootView.addSubview(button1)
rootView.addSubview(button2)
view1.addSubview(button3)
view2.addSubview(button4)
view3.addSubview(button5)
view4.addSubview(button6)
view5.addSubview(button7)
view5.addSubview(button8)

let button9 = UIButton()
let button10 = UIButton()
let button11 = UIButton()

button3.addSubview(button9)
button5.addSubview(button10)
button10.addSubview(button11)

// 查找View树层上的所有button控件
func findInSubView(view: UIView) -> [UIButton] {
    var array = [UIButton]()
    //递归退出条件：没有子View时
    guard !view.subviews.isEmpty else { return array }
    for subView in view.subviews {
        // 是Button就添加
        if subView is UIButton {
            array.append(subView as! UIButton)
        }
        // 不是则往下遍历拿到子视图的buttons
        let subButtons = findInSubView(view: subView)
        array += subButtons
    }
    return array
}

findInSubView(view: rootView).count



// 查找View树层上的所有button控件(封装后)
func getSubViewOf<T>(view: UIView, metaType: AnyClass) -> [T] {
    var array = [T]()
    //递归退出条件：没有子View时
    guard !view.subviews.isEmpty else { return array }
    for subView in view.subviews {
        /* 2种判断均可
        if subView.isKind(of: metaType) {
            array.append(subView as! T)
        }
        */
        // 是Button就添加
        if type(of: subView) == metaType {
            array.append(subView as! T)
        }
        
        // 不是则往下遍历拿到子视图的buttons
        array += getSubViewOf(view: subView, metaType: metaType)
    }
    return array
}

let subButtons: [UIButton] = getSubViewOf(view: rootView, metaType: UIButton.self)
subButtons.count



// 查找View所在的Controller
extension UIView {

    func findController() -> UIViewController! {
        return self.findControllerWithClass(UIViewController.self)
    }
    
    func findNavigator() -> UINavigationController! {
        return self.findControllerWithClass(UINavigationController.self)
    }
    //根据响应者对象遍历
    func findControllerWithClass<T>(_ clzz: AnyClass) -> T? {
        var responder = self.next
        while(responder != nil) {
            if (responder!.isKind(of: clzz)) {
                return responder as? T
            }
            responder = responder?.next
        }
        return nil
    }
}


let controller = UIViewController()
controller.title = "My Controller"
controller.view = rootView

button6.findController()




//: [Next](@next)
