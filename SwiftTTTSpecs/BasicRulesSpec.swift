import Quick
import Nimble
import SwiftTTT

public class BasicRulesSpec: QuickSpec {
    override public func spec() {
        describe("BasicRules") {
            
            let rules = BasicRules()
            
            describe("Creating a set of rules") {
                it("stores player and opponent marks") {
                    expect(rules.player).to(equal("X"))
                    expect(rules.opponent).to(equal("O"))
                }
            }
            
            describe("Checking for a winner") {
                describe("when the user wins") {
                    context("in the first row") {
                        it("returns true") {
                            let board = "XXX______"
                            expect(rules.playerWins(board)).to(beTrue())
                        }
                    }
                    context("in the second row") {
                        it("returns true") {
                            let board = "___XXX___"
                            expect(rules.playerWins(board)).to(beTrue())
                        }
                    }

                    context("in the third row") {
                        it("returns true") {
                            let board = "______XXX"
                            expect(rules.playerWins(board)).to(beTrue())
                        }
                    }

                    context("in the first column") {
                        it("returns true") {
                            let board = "X__X__X__"
                            expect(rules.playerWins(board)).to(beTrue())
                        }
                    }
                    context("in the second column") {
                        it("returns true") {
                            let board = "_X__X__X _"
                            expect(rules.playerWins(board)).to(beTrue())
                        }
                    }
                    
                    context("in the third column") {
                        it("returns true") {
                            let board = "__X__X__X"
                            expect(rules.playerWins(board)).to(beTrue())
                        }
                    }

                    context("in the left to right diagonal") {
                        it("returns true") {
                            let board = "X___X___X"
                            expect(rules.playerWins(board)).to(beTrue())
                        }
                    }

                    context("in the right to left diagonal") {
                        it("returns true") {
                            let board = "__X_X_X__"
                            expect(rules.playerWins(board)).to(beTrue())
                        }
                    }

                }
                describe("when the user does not win") {
                    it("returns false") {
                        let board = "_________"
                        expect(rules.playerWins(board)).to(beFalse())
                    }
                }
            }
        }
    }
}