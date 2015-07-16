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
                var noWinBoard = Board.init(state: "XX_|___|OO_")
                
                context("when there is a winner") {
                    context("in a row") {
                        it("returns true for the player") {
                            expect(rules.playerWins(rowWinBoard)).to(beTrue())
                        }
                        
                        it("returns true for the opponent") {
                            expect(rules.opponentWins(rowWinBoard)).to(beTrue())
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
        }
    }
}