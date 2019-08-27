# 总结-UI部分
#iOS知识点/UI相关 #iOS体系总结

# 重点掌握
## 图像显示、卡顿优化和离屏渲染相关的问题
[图像显示、卡顿优化和离屏渲染](bear://x-callback-url/open-note?id=E1A4C5CC-0B3D-43F8-B9CF-87EDA265A397-2318-0002289FE70915D6)
图像绘制的原理和过程？
卡顿掉帧的原因有哪些？卡顿掉帧应该怎么优化？
什么是离屏渲染？系统进行离屏渲染的目的是什么？离屏渲染消耗性能的原因？哪些场景会触发离屏渲染？怎么解决？

# 图片加载
[图片加载优化原理](bear://x-callback-url/open-note?id=7BEED053-E1CD-445A-BA01-279B7C57F00F-902-00006D7396CD43F8)
如何设计一个图片缓存框架？缓存清理怎样设计？
UIImageView的name和contentOfFile2个方法有什么区别？注意点？
iOS图片加载的详细流程是什么？应该怎样去优化？简单说一下图片后台强制解压缩的流程？

## 视图绘制
[视图绘制相关](bear://x-callback-url/open-note?id=C44B0520-CF59-408F-A4A1-87C3BC8C398E-2318-00022998D9375E73)
视图绘制的全流程有哪些阶段？
什么是异步绘制，怎样进行异步绘制？
系统绘制的流程是怎样的？视图绘制优化方案？drawRect注意点？

## 事件传递/响应
[事件传递/响应机制](bear://x-callback-url/open-note?id=019EBEC8-314F-4DE0-9516-41C4092EBA11-2318-00022693160DAD8D)
系统对于事件是如何进行捕捉的？
事件的传递和响应链你是怎样理解的？
事件的传递和分发流程？hitTest内部实现逻辑？
事件传递具体有哪些应用场景？手动实现？

## TableView
[TableView相关](bear://x-callback-url/open-note?id=A1C2C024-DD7C-4549-ABF0-5A4A2410EF87-2318-00021DBE720615EA)
对TableView重用机制的理解？如何实现一个自定义的重用池？重用可能带来的问题，平常是怎么解决的？重用Cell的获取方式和区别？
多线程情况下数据源同步方案？
TableView常用方法的理解和注意点？
TableView的一般优化思路是什么？

# 其他常见问题
[UI常见问题](bear://x-callback-url/open-note?id=84FB190D-D79D-49AB-9544-B35D7B4D8B86-2318-000226AC85B98AE6)





