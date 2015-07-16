import Quick
import Nimble
import SwiftTTT

public class BoardSpec: QuickSpec {
    override public func spec() {
        describe("Board") {
            let emptyBoard = Board.init()
            let testBoard = Board.init(state: "XOX|XXO|OOX")
            let fullBoard = Board.init(state: "XXO|OOX|XOX")
            let notFullBoard = Board.init(state: "XXO|___|XOX")
            
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
                
                describe("retrieving the rows") {
                    it("returns the rows of the board") {
                        let actualRows = testBoard.rows()
                        let expectedRows: [[Mark]] = [[.X, .O, .X],
                                                      [.X, .X, .O],
                                                      [.O, .O, .X]]
                        for i in 0..<expectedRows.count {
                            expect(actualRows[i]).to(equal(expectedRows[i]))
                        }
                    }
                }
                
                describe("retrieving the columns") {
                    it("returns the columns of the board") {
                        let actualColumns = testBoard.columns()
                        let expectedColumns: [[Mark]] = [[.X, .X, .O],
                                                         [.O, .X, .O],
                                                         [.X, .O, .X]]
                        for i in 0..<expectedColumns.count {
                            expect(actualColumns[i]).to(equal(expectedColumns[i]))
                        }
                    }
                }
                
                describe("retrieving the diagonals") {
                    it("returns the diagonals of the board") {
                        let actualDiagonals = testBoard.diagonals()
                        let expectedDiagonals: [[Mark]] = [[.X, .X, .X],
                                                           [.X, .X, .O]]
                        for i in 0..<expectedDiagonals.count {
                            expect(actualDiagonals[i]).to(equal(expectedDiagonals[i]))
                        }
                    }
                }

                describe("whether the board is full") {
                    context("when every spot has a non-blank mark") {
                        it("returns true") {
                            expect(fullBoard.isFull()).to(beTrue())
                        }
                    }
                    
                    context("when at least one spot is blank") {
                        it("returns false") {
                            expect(notFullBoard.isFull()).to(beFalse())
                        }
                    }
                }
                
                describe("retrieving the open spots") {
                    context("when the board is not full") {
                        it("returns a list of empty spots") {
                            expect(notFullBoard.openSpots()).to(equal([3, 4, 5]))
                        }
                    }
                    
                    context("when the board is full") {
                        it("returns an empty list") {
                            expect(fullBoard.openSpots()).to(beEmpty())
                        }
                    }
                }
            }
        }
    }
}