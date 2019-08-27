# 总结-Swif底层本质
#Swift/本质  #iOS体系总结

# 语法扫盲
[About Swift — The Swift Programming Language (Swift 5.1)](https://docs.swift.org/swift-book/)
[Swift 教程 - SwiftGG](https://swiftgg.gitbook.io/swift/swift-jiao-cheng) 

[一些关键字区别整理](bear://x-callback-url/open-note?id=D5E84ECE-2A68-42B0-BF5B-BE013D46C35B-2318-0000A88A859677E1)
Self和self的区别？.self的理解？
.type和type(of: AnyObject)的区别和理解？
AnyObject、Anyclass、Any的区别和理解？
isKind、is、isMenber的区别和理解？
rethrow的理解？
open、public、internal、fileprivate、 private的理解？

# 探究本质
[Swift各种属性的本质](bear://x-callback-url/open-note?id=AD1F5704-EEFA-4AAC-B3C0-4C4C09123EF0-2318-0000862D137A5FA3)
Swift里let和var的理解？
Swift里计算型属性的本质是什么？占多少个字节？是存储在当前对象里的吗？可以用let修饰吗？
枚举的原始值的本质是什么？占几个字节？它在内存中是存储在枚举里吗？
lazy属性可以用let修饰吗？lazy属性是线程安全的吗？
观察型属性在初始化的时候会触发吗？定义的时候给定默认值会触发吗？
Swift里inout修饰的函数参数本质是什么？
inout的参数能传递计算属性吗？传递计算属性的底层原理是什么？
inout参数传递观察型属性会触发观察的willset和didset方法吗？底层原理又是什么？为什么这样设计？
枚举可以定义存储属性吗？枚举可以定义类型存储属性吗？
类型存储属性和lazy一样是延迟加载吗？如果一样那他时线程安全的吗？为什么？

[String、Araay、Option本质](bear://x-callback-url/open-note?id=097A5BF6-6DBD-41E7-9424-C7D8841F4F6D-961-00008CE89254BDB0)
Swift一个String类型占多少个字节？String类型变量的字面量在内存中是怎样存储的？字面量长度小于16个字节是怎样存储的？大于16个字节又是怎样存储的？
如何计算一个Swift数组在内存中的大小？数组存储在栈空间还是堆空间？
Swift可选类型的本质？

[Swift闭包的本质](bear://x-callback-url/open-note?id=FACF5351-6FFE-4A46-B43C-83A070BC7AE6-2318-00007F105627E638)
Swift闭表的理解？本质是什么？闭包表达式和闭包是什么关系？
Swift闭包值捕获的原理是什么？捕获到的值存储在哪里？捕获多个值时它们在内存中是连续存储的吗？一个捕获到int值的闭包在内存中占几个字节？
DispatchQueue.async闭包体内为什么要强制加self.访问成员变量？说一下你对逃逸闭包的理解？
Swift里的??运算符的作用？本质是什么？

[Swift多态原理](bear://x-callback-url/open-note?id=93FCEC0A-FBC5-49DB-8EA1-9AD5C1028BB7-2318-00009B1818F3AB2E) [Swift 方法派发](bear://x-callback-url/open-note?id=CF70958A-ADB7-431D-8CEC-4C4993564BE8-2318-0000CCA32FCA8FDB)
Swift里是怎样实现多态的？Swift支持哪些方法派发方式？内部机制又是怎样的？引用类型、值类型、协议的方法派发有什么不同？为什么官方建议使用结构体+协议的组合而不使用class类型？

[Swift里的指针](bear://x-callback-url/open-note?id=E8ABFC3C-B38D-4B5B-B3FC-0D0F164E298C-961-00009161A1E39C8E)
Swift里有那几种类型的指针？有什么区别？

# 特性和优化
[函数和协议编程](bear://x-callback-url/open-note?id=755806D3-2ED3-4587-B6EC-0E869BD55899-43626-000580B8F07F9677) [Swift反射机制](bear://x-callback-url/open-note?id=504F816A-F075-48E9-9E71-3785CEAC3CE1-2318-0000A66E23E6466D) [Swift性能优化](bear://x-callback-url/open-note?id=DB855134-5DF1-4D50-B99E-E61196D55B29-2318-000117D5C4809327)
大概描述一下Swift的编译流程？Swift和OC的区别？
面向协议编程的理解？对函数式编程的理解？map和flatMap的区别？filter、reduce的理解？
对Swift里反射机制的理解？
如何优化Swift性能？

# 其他常见问题
[Swift 常见问题](bear://x-callback-url/open-note?id=E0313441-587E-4647-B31B-055EC6AE9203-2318-000160020344BE54)



