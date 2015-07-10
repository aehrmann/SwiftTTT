import Quick
import Nimble
import SwiftTTT

class MainViewControllerSpec: QuickSpec {
    override func spec() {

        func createButtons() -> [UIButton] {
            var buttons = [UIButton]()
            for i in 0..<9 {
                buttons.append(UIButton())
            }
            return buttons
        }

        describe("MainViewController") {
            var controller: MainViewController!

            describe("Loading the view") {

                beforeEach {
                    controller = MainViewController()
                    controller.gridButtons = createButtons()
                    controller.viewDidLoad()
                }

                it("sets all grid buttons to blank state") {
                    for button in controller.gridButtons {
                        expect(button.titleForState(.Normal)).to(equal(""))
                    }
                }

                it("creates a board") {
                    expect(controller.board).notTo(beNil())
                }

                it("creates a the rules") {
                    expect(controller.rules).notTo(beNil())
                }
            }

            describe("Updating the board") {
                var controller: MainViewController!

                beforeEach {
                    controller = MainViewController()
                    controller.gridButtons = createButtons()
                    controller.viewDidLoad()
                }

                context("when the cell is not marked") {
                    context("when an X is placed in a cell") {
                        beforeEach {
                            controller.updatePosition(0)
                        }

                        it("updates the corresponding position on the board") {
                            expect(controller.board.markAt(0)).to(equal(Mark.X))
                        }

                        it("changes the cell's button text to X") {
                            expect(controller.gridButtons[0].titleForState(.Normal)).to(equal("X"))
                        }
                    }

                    context("when an O is placed in a cell") {
                        beforeEach {
                            controller.updatePosition(0)
                            controller.updatePosition(1)
                        }

                        it("updates the corresponding position on the board") {
                            expect(controller.board.markAt(1)).to(equal(Mark.O))
                        }

                        it("changes the cell's button text to O") {
                            expect(controller.gridButtons[1].titleForState(.Normal)).to(equal("O"))
                        }
                    }
                }

                context("when the cell is already marked") {
                    beforeEach {
                        controller.updatePosition(0)
                        controller.updatePosition(0)
                    }

                    it("does not change the corresponding mark on the board") {
                        expect(controller.board.markAt(0)).to(equal(Mark.X))
                    }

                    it("does not change the text of the button") {
                        expect(controller.gridButtons[0].titleForState(.Normal)).to(equal("X"))
                    }
                }
            }
        }
    }
}
