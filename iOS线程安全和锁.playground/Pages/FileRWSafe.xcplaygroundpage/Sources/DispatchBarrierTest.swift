import Foundation

public class DispatchBarrierTest {
    
    var fileQueue = DispatchQueue(label: "fileQueue", attributes: .concurrent)
    public init() {
    }
    
    public func testFileRW(){
        for _ in 0..<10 {
            fileQueue.async(flags: .barrier) {
                self.writeFile()
            }
            fileQueue.async {
                self.readFile()
            }
            fileQueue.async {
                self.readFile()
            }
            fileQueue.async {
                self.readFile()
            }
        }
    }
    
    func readFile() {
        Thread.sleep(forTimeInterval: 2)
        print("读文件")
    }
    
    func writeFile() {
        Thread.sleep(forTimeInterval: 2)
        print("写文件")
    }
    
}

