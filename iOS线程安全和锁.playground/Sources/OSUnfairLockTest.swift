import Foundation

public class OSUnfairLockTest: Problem {
    
    var moneyLock = os_unfair_lock(_os_unfair_lock_opaque: 0)
    var ticketsLock = os_unfair_lock(_os_unfair_lock_opaque: 0)
    
    
    override func saveMoney(money: Int) {
        os_unfair_lock_lock(&moneyLock)
        super.saveMoney(money: money)
        os_unfair_lock_unlock(&moneyLock)
    }
    
    override func drawMoney(money: Int) {
        os_unfair_lock_lock(&moneyLock)
        super.drawMoney(money: money)
        os_unfair_lock_unlock(&moneyLock)
    }
    
    override func saleTicket(ticket: Int) {
        os_unfair_lock_lock(&ticketsLock)
        super.saleTicket(ticket: ticket)
        os_unfair_lock_unlock(&ticketsLock)
    }
}
