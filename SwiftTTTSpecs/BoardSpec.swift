import Quick
import Nimble
import SwiftTTT

public class BoardSpec: QuickSpec {
    override public func spec() {
        describe("Board") {
            
            describe("Creating a board") {
                it("can be initialized as empty") {
                    let board = Board.init()
                    expect(board.isEmpty()).to(beTrue())
                }
                it("can be created by adding a mark") {
                    let board = Board.init()
                    let newBoard = board.marked(with: Mark.X, at: 0)
                    expect(newBoard.marks[0]).to(equal(Mark.X))
                }
            }
        }
    }
}