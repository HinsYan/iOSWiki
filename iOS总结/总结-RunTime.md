# 总结-RunTime
#iOS知识点/Runtime #iOS体系总结

# 重点掌握
## Runtime基础
[Runtime-基础](bear://x-callback-url/open-note?id=4E0A7F89-5CC3-40AE-A846-3BA13CD1C738-2318-0000D736A097A9B0)
你对Runtime的理解？dynamic 关键字的理解？

## Runtime相关数据结构
[Runtime数据结构](bear://x-callback-url/open-note?id=2FB2FB77-CB8F-46C3-82F5-428D1EC48217-2318-0000E11A279DC0A6)
runtime基础数据结构有哪些？对应的关系？
实例对象数据结构？
类对象的数据结构？
运行时的类相关信息存放在哪？是怎样获取的？
编译期的类相关信息存放在哪？和运行期的类相关信息有什么关系？
方法描述method_t是一个怎样的结构？
方法缓存chche_t是一个怎样的结构？有哪些特点？

## isa指针的理解
[isa相关](bear://x-callback-url/open-note?id=0727A9C9-E925-4589-9472-87032FA57932-2318-00023216196127BD)
你对OC中isa的理解？
isa的指向关系？
实例对象、类对象和元类对象的联系和区别有哪些？
ARM64位之后isa优化原理？什么是共用体？怎样判断共用体的大小？isa中结构体的位域有什么用吗？
isa取指向地址的原理？

## Runtime消息机制
[Runtime消息机制](bear://x-callback-url/open-note?id=16829C9C-B52A-48BF-AD35-2EE6EC95A2A3-2318-0000E2476FD0D904)
OC消息调用的本质是什么？
OC动态方法派发的过程？
消息发送阶段的过程是怎样的？
消息发送阶段缓存查找的过程？缓存查找的原理？查找过程中如何处理哈希碰撞？
消息发送阶在当前类对象中的查找是怎样的？
动态方法解析阶段的过程？怎样动态添加方法实现？
消息转发阶段的过程是怎样的？有哪些应用场景？

## Runtime的实际应用
[常见API](bear://x-callback-url/open-note?id=AC95307C-06AD-4CF1-9DE5-E5309FD7AACE-2318-0000EA23AE6D4677) [Runtime 应用](bear://x-callback-url/open-note?id=E81E1954-21A0-4EC5-AFD0-B93C1AC1D6FC-2318-000236FA599927C3)
runtime场景API有了解吗？
平常有用过runtime？一般来干什么？怎样实现？

## Swift 中的Runtime理解
[Swift Runtime](bear://x-callback-url/open-note?id=7DC2A470-5989-489D-B8AB-DC37FD568997-2318-00015CFDECBF55A3)
你对Swift中Runtime的理解？


