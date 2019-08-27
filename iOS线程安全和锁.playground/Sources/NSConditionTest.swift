import Foundation

public class NSConditionTest: Problem {
    
    var condition = NSCondition()
    
    public override init() {
        super.init()
    }
    
    override func saveMoney(money: Int) {
        //加锁
        condition.lock()
        super.saveMoney(money: money)
        //唤醒等着这个条件的锁
        condition.signal()
        //解锁
        condition.unlock()
        
    }
    
    override func drawMoney(money: Int) {
        //加锁
        condition.lock()
        if money > self.totalMoney {
            print("余额不足")
            //第一次：睡眠并等待唤醒条件，同时放开着把锁
            //被条件唤醒时：加锁后继续执行
            condition.wait()
        }
        super.drawMoney(money: money)
        //解锁
        condition.unlock()
        
    }
    
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
