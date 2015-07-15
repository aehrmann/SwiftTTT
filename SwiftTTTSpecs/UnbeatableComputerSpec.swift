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
            }
            
            describe("Choosing the next move") {
                it("wins when it can") {
                    let board = mutableBoardWithMarksAtPositions([.O: [0, 1]])
                    expect(computer.nextMove(board)).to(equal(2))
                }
                
                it("blocks an opponent's win") {
                    let board = mutableBoardWithMarksAtPositions([.X: [3, 4]])
                    expect(computer.nextMove(board)).to(equal(5))
                }
            }
        }
    }
}