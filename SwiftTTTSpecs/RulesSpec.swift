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
        }
    }
}