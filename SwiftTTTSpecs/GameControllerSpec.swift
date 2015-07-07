import Quick
import Nimble
import SwiftTTT

public class GameControllerSpec: QuickSpec {
    override public func spec() {
        describe("GameController") {

            describe("Loading the view") {
                it("constructs a board") {
                    let controller = GameController()
                    expect(controller.board).notTo(beNil())
                }

                it("constructs the rules for the game") {
                    let controller = GameController()
                    expect(controller.rules).notTo(beNil())
                }
            }
        }
    }
}