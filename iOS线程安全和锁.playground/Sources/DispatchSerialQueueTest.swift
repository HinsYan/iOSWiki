import Foundation

public class DispatchSerialQueueTest: Problem {
    
    var moneySerialQueue = DispatchQueue(label: "moneySerialQueue")
    var ticketsSerialQueue = DispatchQueue(label: "ticketsSerialQueue")
    
    public override init() {
        super.init()
    }
    
    override func saveMoney(money: Int) {
        moneySerialQueue.sync {
            super.saveMoney(money: money)
        }
    }
    
    override func drawMoney(money: Int) {
        moneySerialQueue.sync {
            super.drawMoney(money: money)
        }
    }
    
    override func saleTicket(ticket: Int) {
        ticketsSerialQueue.sync {
            super.saleTicket(ticket: ticket)
        }
    }
}

