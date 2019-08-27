import Foundation

public class PThreadRWLockTest {
    
    var fileRWLock = pthread_rwlock_t()
    public init() {
        pthread_rwlock_init(&fileRWLock, nil)
    }
    
    public func testFileRW(){
        for _ in 0..<10 {
            DispatchQueue.global().async {
                self.writeFile()
            }
            DispatchQueue.global().async {
                self.readFile()
            }
            DispatchQueue.global().async {
                self.readFile()
            }
            DispatchQueue.global().async {
                self.readFile()
            }

        }
    }
    
    func readFile() {
        pthread_rwlock_rdlock(&fileRWLock)
        Thread.sleep(forTimeInterval: 2)
        print("读文件")
        pthread_rwlock_unlock(&fileRWLock)
    }
    
    func writeFile() {
        pthread_rwlock_wrlock(&fileRWLock)
        Thread.sleep(forTimeInterval: 2)
        print("写文件")
        pthread_rwlock_unlock(&fileRWLock)
    }

}
