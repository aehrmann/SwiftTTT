import Quick
import Nimble
import SwiftTTT

public class RulesSpec: QuickSpec {
    override public func spec() {
        var rules: Rules!

        describe("Checking for a win") {

            beforeEach {
                rules = Rules()
            }

            context("when a mark wins in a row") {

                it("returns true when X wins a row") {
                    let board = boardWithMarksAtPositions([.X: [0, 1, 2]])

                    expect(rules.markIsWinner(.X, of: board)).to(beTrue())
                }

                it("returns true when O wins a row") {
                    let board = boardWithMarksAtPositions([.O: [6, 7, 8]])
                    expect(rules.markIsWinner(.O, of: board)).to(beTrue())
                }
            }

            context("when a mark wins in a column") {

                it("returns true when X wins in a column") {
                    let board = boardWithMarksAtPositions([.X: [0, 3, 6]])
                    expect(rules.markIsWinner(.X, of: board)).to(beTrue())
                }

                it("returns true when O wins in a column") {
                    let board = boardWithMarksAtPositions([.O: [2, 5, 8]])
                    expect(rules.markIsWinner(.O, of: board)).to(beTrue())
                }
            }

            context("when a mark wins on a diagonal") {

                it("returns true when X wins on a diagonal") {
                    let board = boardWithMarksAtPositions([.X: [0, 4, 8]])
                    expect(rules.markIsWinner(.X, of: board)).to(beTrue())
                }

                it("returns true when O wins on a diagonal") {
                    let board = boardWithMarksAtPositions([.O: [2, 4, 6]])
                    expect(rules.markIsWinner(.O, of: board)).to(beTrue())
                }

            }
            context("when a mark doesn't win in any row, column, or diagonal") {
                
                it("returns false when X does not win") {
                    let board = Board()
                    expect(rules.markIsWinner(.X, of: board)).to(beFalse())
                }

                it("returns false when O does not win") {
                    let board = Board()
                    expect(rules.markIsWinner(.O, of: board)).to(beFalse())
                }
            }
        }

        describe("Checking for a draw") {
            context("when there is a winner") {
                it("returns false") {
                    let board = boardWithMarksAtPositions([.X: [0, 1, 2]])
                    expect(rules.isDraw(board)).to(beFalse())
                }
            }

            context("when the board is full and has no winner") {
                it("returns true") {
                    let board = boardWithMarksAtPositions([.X: [0, 2, 3, 4, 7],
                                                           .O: [1, 5, 6, 8]])

                    expect(rules.isDraw(board)).to(beTrue())
                }
            }
        }
    }
}

