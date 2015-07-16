import Quick
import Nimble
import SwiftTTT

public class BoardSpec: QuickSpec {
    override public func spec() {
        describe("Board") {
            let emptyBoard = Board.init()
            
            describe("Creating a board") {
                it("can be initialized as empty") {
                    expect(emptyBoard.isEmpty()).to(beTrue())
                }
                
                it("can be created by adding a mark") {
                    let board = emptyBoard.marked(with: Mark.X, at: 0)
                    expect(board.isEmpty()).to(beFalse())
                }
            }
            
            describe("Retrieving attributes of the board") {
                describe("retrieving marks at a given spot") {
                    context("when the spot has been marked") {
                        it("returns the mark at that spot") {
                            let board = emptyBoard.marked(with: Mark.O, at: 1)
                            expect(board.isMarked(at: 1)).to(beTrue())
                        }
                    }
                }
            }
        }
    }
}