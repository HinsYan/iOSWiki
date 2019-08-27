import Foundation

public class Problem {
    
    var totalMoney = 200
    var totalTickets = 15
    
    public init() {
        
    }
    
    func saveMoney(money: Int) {
        var oldMoney = totalMoney
        Thread.sleep(forTimeInterval: 0.2)
        oldMoney += money
        totalMoney = oldMoney
        print("存入\(money)元，还剩：\(totalMoney)元【CurrentThread：\(Thread.current)")
    }
    
    func drawMoney(money: Int) {
        guard totalMoney >= money else {
            print("余额不足,无法取出\(money)元，当前还剩：\(totalMoney)元")
            return
        }
        
        var oldMoney = totalMoney
        Thread.sleep(forTimeInterval: 0.2)
        oldMoney -= money
        totalMoney = oldMoney
        print("取出\(money)元，还剩：\(totalMoney)元【CurrentThread：\(Thread.current)")
    }
    
    func saleTicket(ticket: Int) {
        guard totalTickets >= ticket else {
            print("余票不足,无法取出\(ticket)张，当前还剩：\(totalMoney)张")
            return
        }
        
        var oldTickets = totalTickets
        Thread.sleep(forTimeInterval: 0.2)
        oldTickets -= ticket
        totalTickets = oldTickets
        print("卖出\(ticket)张票，还剩：\(totalTickets)张【CurrentThread：\(Thread.current)")
    }
    
    public func ticketTest() {
        self.totalTickets = 15
        let ticketQueue = DispatchQueue(label: "com.hinson.ticketQueue", qos: .default, attributes: [.concurrent], autoreleaseFrequency: .never, target: nil)
        ticketQueue.async {
            for _ in 0..<5 {
                self.saleTicket(ticket: 1)
            }
        }
        ticketQueue.async {
            for _ in 0..<5 {
                self.saleTicket(ticket: 1)
            }
        }
        ticketQueue.async {
            for _ in 0..<5 {
                self.saleTicket(ticket: 1)
            }
        }
    }
    
    public func moneyTest() {
        self.totalMoney = 200
        let moneyQueue = DispatchQueue(label: "com.hinson.moneyQueue", qos: .default, attributes: [.concurrent], autoreleaseFrequency: .never, target: nil)
        moneyQueue.async {
            for _ in 0..<10 {
                self.saveMoney(money: 50)
            }
        }
        moneyQueue.async {
            for _ in 0..<10 {
                self.drawMoney(money: 20)
            }
        }
    }

}
