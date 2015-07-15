import Quick
import Nimble
import SwiftTTT

public class MutableBoardSpec: QuickSpec {
    override public func spec() {
        describe("MutableBoard") {

            describe("Placing a mark on the board") {
                var board: MutableBoard!

                beforeEach {
                    board = MutableBoard()
                }

                it("places an X at the given position") {
                    board.placeMark(Mark.X, at: 0)

                    expect(board.markAt(0)).to(equal(Mark.X))
                }

                it("places an O at the given position") {
                    board.placeMark(Mark.O, at: 1)

                    expect(board.markAt(1)).to(equal(Mark.O))
                }
            }

            describe("Checking if the board is full") {

                context("when the board is full") {
                    it("returns true") {
                        let allPositions = Array(0..<9)
                        let board = mutableBoardWithMarksAtPositions([.X: allPositions])

                        expect(board.isFull()).to(beTrue())
                    }
                }
                context("when the board is not full") {
                    it("returns false") {
                        let board = MutableBoard()

                        expect(board.isFull()).to(beFalse())
                    }
                }
            }

            describe("Checking if the board is empty") {
                var board: MutableBoard!

                beforeEach {
                    board = MutableBoard()
                }

                context("when the board is initially created") {
                    it("is empty") {
                        expect(board.isEmpty()).to(beTrue())
                    }
                }
                context("when a mark has been placed on the board") {
                    it("is not empty") {
                        board.placeMark(.X, at: 0)

                        expect(board.isEmpty()).to(beFalse())
                    }
                }
            }
        }
    }
}