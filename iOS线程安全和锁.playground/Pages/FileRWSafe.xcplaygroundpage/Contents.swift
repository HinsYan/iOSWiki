//: A UIKit based Playground for presenting user interface
import Foundation
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    
    var testPThreadRWLock = PThreadRWLockTest()
    var testDispatchBarrier = DispatchBarrierTest()

    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "文件读写安全"
        label.textColor = .black
        
        view.addSubview(label)
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //testPThreadRWLock.testFileRW()
        testDispatchBarrier.testFileRW()
        
    }
    
        
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
