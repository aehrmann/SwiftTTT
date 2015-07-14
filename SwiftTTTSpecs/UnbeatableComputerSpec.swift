import Quick
import Nimble
import SwiftTTT

public class UnbeatableComputerSpec: QuickSpec {
    override public func spec() {
        describe("UnbeatableComputer") {
            
            describe("Creating an unbeatable computer") {
                it("stores O as its mark") {
                    let computer = UnbeatableComputer()
                    expect(computer.mark).to(equal(Mark.O))
                }
            }
        }
    }
}