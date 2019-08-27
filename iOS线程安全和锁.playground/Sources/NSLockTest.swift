import Foundation

public class NSLockTest: Problem {
    
    var moneyLock = NSLock()
    var ticketsLock = NSLock()
    
    
    override func saveMoney(money: Int) {
        moneyLock.lock()
        super.saveMoney(money: money)
        moneyLock.unlock()
    }
    
    override func drawMoney(money: Int) {
        moneyLock.lock()
        super.drawMoney(money: money)
        moneyLock.unlock()
    }
    
    override func saleTicket(ticket: Int) {
        ticketsLock.lock()
        super.saleTicket(ticket: ticket)
        ticketsLock.unlock()
    }
}
