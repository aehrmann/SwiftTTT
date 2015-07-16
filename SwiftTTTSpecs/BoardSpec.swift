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
                
                describe("whether a spot has been marked") {
                    context("when the spot has been marked") {
                        it("returns true") {
                            let board = emptyBoard.marked(with: Mark.O, at: 1)
                            expect(board.isMarked(at: 1)).to(beTrue())
                        }
                    }
                    context("when the spot has not been marked") {
                        it("returns false") {
                            expect(emptyBoard.isMarked(at: 2)).to(beFalse())
                        }
                    }
                }
                
                describe("what mark is at a given spot") {
                    context("when the spot has been marked") {
                        it("returns mark at the spot") {
                            let board = emptyBoard.marked(with: .X, at: 3)
                            expect(board.markAt(3)).to(equal(Mark.X))
                        }
                    }
                    
                    context("when the spot has been marked") {
                        context("it returns a blank mark") {
                            expect(emptyBoard.markAt(4)).to(equal(Mark.Blank))
                        }
                    }
                }
            }
        }
    }
}