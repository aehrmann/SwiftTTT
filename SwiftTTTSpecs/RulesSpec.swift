import Quick
import Nimble
import SwiftTTT

public class RulesSpec: QuickSpec {
    override public func spec() {
        describe("Rules") {
            let rules = Rules()
            
            describe("Creating the rules") {
                it("initializes the player to X") {
                    expect(rules.player).to(equal(Mark.X))
                }
            
                it("initializes the opponent to O") {
                    expect(rules.opponent).to(equal(Mark.O))
                }
            }

            describe("Reporting a win") {
                
                var rowWinBoard = Board.init(state: "XXX|___|OOO")
                var columnWinBoard = Board.init(state: "XO_|XO_|XO_")
                var noWinBoard = Board.init(state: "XX_|___|OO_")
                
                context("when there is a win") {
                    context("when the win is in a row") {
                        it("returns true for the player") {
                            expect(rules.playerWins(rowWinBoard)).to(beTrue())
                        }
                        
                        it("returns true for the opponent") {
                            expect(rules.opponentWins(rowWinBoard)).to(beTrue())
                        }
                    }
                    
                    context("when the win is in a column") {
                        it("returns true for the player") {
                            expect(rules.playerWins(columnWinBoard)).to(beTrue())
                        }
                        
                        it("returns true for the opponent") {
                            expect(rules.opponentWins(rowWinBoard)).to(beTrue())
                        }
                    }
                    
                    context("when the win is along a diagonal") {
                        context("when the win is along the left-to-right diagonal") {
                            it("returns true") {
                                let board = Board.init(state: "X__|_X_|__X")
                                expect(rules.playerWins(board)).to(beTrue())
                            }
                        }
                        
                        context("when the win is along the right-to-left diagonal") {
                            it("returns true") {
                                let board = Board.init(state: "__O|_O_|O__")
                                expect(rules.opponentWins(board)).to(beTrue())
                            }
                        }
                    }
                }
                
                context("when there is not a winner") {
                    it("does not return true for the player") {
                        expect(rules.playerWins(noWinBoard)).to(beFalse())
                    }
                    it("does not return true for the opponent") {
                        expect(rules.opponentWins(noWinBoard)).to(beFalse())
                    }
                }
            }
            
            describe("Reporting a draw") {

                var noWinBoard = Board.init(state: "XOX|OXO|OOX")
                var winBoard = Board.init(state: "OOO|___|___")
                
                context("when there is no winner") {
                    context("when the game is over") {
                        it("returns true") {
                            var board = Board.init(state: "XOX|OXO|OXO")
                            expect(rules.isDraw(board)).to(beTrue())
                        }

                    }
                    context("when the game is not over") {
                        it("returns false") {
                            var board = Board.init(state: "OXO|___|___")
                            expect(rules.isDraw(board)).to(beFalse())
                        }
                    }
                }
                
                context("when there is a winner") {
                    it("returns false") {
                        let board = Board.init(state: "XXO|XXO|OOX")
                        expect(rules.isDraw(board)).to(beFalse())
                    }
                }
            }
        }
    }
}