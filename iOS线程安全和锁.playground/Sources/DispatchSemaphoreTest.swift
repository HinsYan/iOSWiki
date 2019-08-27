import Foundation

public class DispatchSemaphoreTest: Problem {
    
    var moneySemaphore = DispatchSemaphore(value: 1)
    var ticketsSemaphore = DispatchSemaphore(value: 1)
    
    
    override func saveMoney(money: Int) {
        //如果信号量值 > 0, 就让信号量减1，并且继续往下执行
        //如果信号量值 <= 0, 就会休眠等待（后面是等待时间），直到信号量>0后让信号量减1，并且继续往下执行
        _ = moneySemaphore.wait(timeout: DispatchTime.distantFuture)
        super.saveMoney(money: money)
        //信号量 +1
        moneySemaphore.signal()
    }
    
    override func drawMoney(money: Int) {
        _ = moneySemaphore.wait(timeout: DispatchTime.distantFuture)
        super.drawMoney(money: money)
        moneySemaphore.signal()
    }
    
    override func saleTicket(ticket: Int) {
        _ = ticketsSemaphore.wait(timeout: DispatchTime.distantFuture)
        super.saleTicket(ticket: ticket)
        ticketsSemaphore.signal()
    }
}

