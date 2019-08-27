import Foundation

public class OSSpinLockTest: Problem {
    
    var moneyLock = OS_SPINLOCK_INIT
    var ticketsLock = OS_SPINLOCK_INIT

    
    override func saveMoney(money: Int) {
        OSSpinLockLock(&moneyLock)
        super.saveMoney(money: money)
        OSSpinLockUnlock(&moneyLock)
    }
    
    override func drawMoney(money: Int) {
        OSSpinLockLock(&moneyLock)
        super.drawMoney(money: money)
        OSSpinLockUnlock(&moneyLock)
    }
    
    override func saleTicket(ticket: Int) {
        OSSpinLockLock(&ticketsLock)
        super.saleTicket(ticket: ticket)
        OSSpinLockUnlock(&ticketsLock)
    }
}
