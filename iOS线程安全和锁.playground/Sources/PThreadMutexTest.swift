import Foundation

public class PThreadMutexTest: Problem {
    
    var moneyLock = pthread_mutex_t()
    var ticketsLock = pthread_mutex_t()
    
    
    public override init() {
        super.init()
        initMutex(mutex: &moneyLock)
        initMutex(mutex: &ticketsLock)
    }
    
    func initMutex(mutex: inout pthread_mutex_t) {
        //设置锁的属性(注意销毁，清内存)
        var attr = pthread_mutexattr_t()
        pthread_mutexattr_init(&attr)
        pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_DEFAULT)
        //初始化锁（可以直接传空，传空就是PTHREAD_MUTEX_DEFAULT的属性）
        //pthread_mutex_init(&mutex, nil)
        pthread_mutex_init(&mutex, &attr)
        //销毁
        pthread_mutexattr_destroy(&attr)
                
    }
    
    override func saveMoney(money: Int) {
        pthread_mutex_lock(&moneyLock)
        super.saveMoney(money: money)
        pthread_mutex_unlock(&moneyLock)
      
    }
    
    override func drawMoney(money: Int) {
        pthread_mutex_lock(&moneyLock)
        super.drawMoney(money: money)
        pthread_mutex_unlock(&moneyLock)
 
    }
    
    override func saleTicket(ticket: Int) {
        pthread_mutex_lock(&ticketsLock)
        super.saleTicket(ticket: ticket)
        pthread_mutex_unlock(&ticketsLock)

    }
}
