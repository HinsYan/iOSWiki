import Foundation

public class NSConditionLockTest: Problem {
    
    var condition = NSConditionLock(condition: 0)
    
    public override init() {
        super.init()
    }
    //先存
    override func saveMoney(money: Int) {
        //加锁(当条件值为0时才会加锁，不为0时则休眠，并等待锁条件为0时再加锁往下走)
        condition.lock(whenCondition: 0)
        super.saveMoney(money: money)
        //解锁并把条件值置为1
        condition.unlock(withCondition: 1)
        
    }
    //再取
    override func drawMoney(money: Int) {
        //加锁（当条件值为1时才会加锁，不为1时则休眠，并等待锁条件为1时再加锁往下走）
        condition.lock(whenCondition: 1)
        super.drawMoney(money: money)
        //解锁并把条件值置为0
        condition.unlock(withCondition: 0)
        
    }
    
    //存一次取一次
    public override func moneyTest() {
        self.totalMoney = 0
        let moneyQueue = DispatchQueue(label: "com.hinson.moneyQueue", attributes: .concurrent)
        moneyQueue.async {
            for _ in 0..<10 {
                self.drawMoney(money: 50)
            }
        }
        moneyQueue.async {
            for _ in 0..<10 {
                self.saveMoney(money: 50)
            }
        }
    }
    
}
