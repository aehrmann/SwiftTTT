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
                
                it("creates forks for itself") {
                    var board = Board.init(state: "_X_|XOX|_O_")
                    expect(computer.nextMove(board)).to(equal(6))
                    
                    board = Board.init(state: "_O_|XOX|_X_")
                    expect(computer.nextMove(board)).to(equal(0))
                    
                    board = Board.init(state: "_X_|XOO|_X_")
                    expect(computer.nextMove(board)).to(equal(2))

                    board = Board.init(state: "_X_|OOX|_X_")
                    expect(computer.nextMove(board)).to(equal(0))
                }
                
                it("blocks a user's fork") {
                    var board = Board.init(state: "X__|_O_|__X")
                    expect(computer.nextMove(board)).to(equal(1))
                }
                
//                it("takes the center on an empty board") {
//                    let emptyBoard = Board.init(state: "___|___|___")
//                    expect(computer.nextMove(emptyBoard)).to(equal(4))
//                }
            }
        }
    }
}