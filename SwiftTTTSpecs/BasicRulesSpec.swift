import Quick
import Nimble
import SwiftTTT

public class BasicRulesSpec: QuickSpec {
    override public func spec() {
        describe("BasicRules") {
            
            describe("Creating a set of rules") {
                it("stores player and opponent marks") {
                    let rules = BasicRules()
                    expect(rules.player).to(equal("X"))
                    expect(rules.opponent).to(equal("O"))
                }
            }
        }
    }
}