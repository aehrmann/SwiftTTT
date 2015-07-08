import Quick
import Nimble
import SwiftTTT

public class GameViewControllerSpec: QuickSpec {
    override public func spec() {
        describe("GameController") {
            var controller: GameViewController!

            beforeEach {
                controller = GameViewController()
            }
            describe("Loading the view") {
                it("constructs a board") {
                    expect(controller.board).notTo(beNil())
                }

                it("constructs the rules for the game") {
                    expect(controller.rules).notTo(beNil())
                }
            }
        }
    }
}