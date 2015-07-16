import Quick
import Nimble
import SwiftTTT

public class UnbeatableComputerSpec: QuickSpec {
    override public func spec() {
        describe("UnbeatableComputer") {
            let computer = UnbeatableComputer()
            
            describe("Creating an unbeatable computer") {
                it("stores O as its mark") {
                    expect(computer.mark).to(equal(Mark.O))
                }
                
                it("creates a rule set") {
                    expect(computer.rules).notTo(beNil())
                }
            }
            
            describe("Choosing the next move") {
                it("wins when it can") {
                    let board = Board.init(state: "OO_|___|___")
                    expect(computer.nextMove(board)).to(equal(2))
                }
                
                it("blocks an opponent's win") {
                    let board = Board.init(state: "___|XX_|___")
                    expect(computer.nextMove(board)).to(equal(5))
                }
            }
        }
    }
}