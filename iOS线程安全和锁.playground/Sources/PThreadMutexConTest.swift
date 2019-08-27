import Foundation

public class PThreadMutexConTest: Problem {
    
    var moneyLock = pthread_mutex_t()
    var condition = pthread_cond_t()
    
    public override init() {
        super.init()
        initMutexAndCondition()
    }
    
    func initMutexAndCondition() {
        //设置锁的属性(注意销毁，清内存)
        //初始化锁（可以直接传空，传空就是PTHREAD_MUTEX_DEFAULT的属性）
        pthread_mutex_init(&moneyLock, nil)
        pthread_cond_init(&condition, nil)
        
    }
    
    override func saveMoney(money: Int) {
        //加锁
        pthread_mutex_lock(&moneyLock)
        super.saveMoney(money: money)
        //唤醒等着这个条件的锁(此时等着这个锁的线程也不会立马持有锁，这里只是个信号，需要等下面方法执行后，当前线程放开这把锁后等着的线程才能持有这把锁)
        pthread_cond_signal(&condition)
        //解锁
        pthread_mutex_unlock(&moneyLock)
        
    }
    
    override func drawMoney(money: Int) {
        //加锁
        pthread_mutex_lock(&moneyLock)
        if money > self.totalMoney {
            print("余额不足")
            //第一次：睡眠并等待唤醒条件，同时放开着把锁
            //被条件唤醒时：加锁后继续执行
            pthread_cond_wait(&condition, &moneyLock)
        }
        super.drawMoney(money: money)
        //解锁
        pthread_mutex_unlock(&moneyLock)
        
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
    
    //释放锁资源
    deinit {
        pthread_mutex_destroy(&moneyLock)
        pthread_cond_destroy(&condition)
    }
}
