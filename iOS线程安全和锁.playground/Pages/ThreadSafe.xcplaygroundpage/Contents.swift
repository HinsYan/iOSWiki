//: A UIKit based Playground for presenting user interface
import Foundation
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    
    var testOSSpinLock: OSSpinLockTest!
    var testOSUnfairLock: OSUnfairLockTest!
    var testPThreadMutex: PThreadMutexTest!
    var testPThreadMutexCon: PThreadMutexConTest!
    var testNSLock: NSLockTest!
    var testNSCondition: NSConditionTest!
    var testNSConditionLock: NSConditionLockTest!
    var testDispatchSerialQueue: DispatchSerialQueueTest!
    var testDispatchSemaphore: DispatchSemaphoreTest!
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "多线程安全和锁"
        label.textColor = .black
        
        view.addSubview(label)
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //testOSSpinLock = OSSpinLockTest()
        //testOSSpinLock.moneyTest()
        //testOSSpinLock.ticketTest()
        
        //testOSUnfairLock = OSUnfairLockTest()
        //testOSUnfairLock.moneyTest()
        //testOSUnfairLock.ticketTest()
        
        //testPThreadMutex = PThreadMutexTest()
        //testPThreadMutex.moneyTest()
        //testPThreadMutex.ticketTest()
        
        //testPThreadMutexCon = PThreadMutexConTest()
        //testPThreadMutexCon.moneyTest()
        
        //testNSLock = NSLockTest()
        //testNSLock.moneyTest()
        //testNSLock.ticketTest()
        
        //testNSCondition = NSConditionTest()
        //testNSCondition.moneyTest()
        
        
        //testNSConditionLock = NSConditionLockTest()
        //testNSConditionLock.moneyTest()
        
        //testDispatchSerialQueue = DispatchSerialQueueTest()
        //testDispatchSerialQueue.moneyTest()
        //testDispatchSerialQueue.ticketTest()
        
        testDispatchSemaphore = DispatchSemaphoreTest()
        testDispatchSemaphore.moneyTest()
        testDispatchSemaphore.ticketTest()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
    }
    
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
