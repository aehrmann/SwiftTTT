import Quick
import Nimble
import SwiftTTT

class MainViewControllerSpec: QuickSpec {
    override func spec() {

        describe("MainViewController") {
            var controller: MainViewController!
            var buttons: [UIButton]!

            describe("Loading the view") {
                it("sets all grid buttons to blank state") {
                    controller = MainViewController()
                    buttons = [UIButton](count: 9, repeatedValue: UIButton())
                    controller.gridButtons = buttons

                    controller.viewDidLoad()

                    for button in controller.gridButtons {
                        expect(button.titleForState(.Normal)).to(equal("_"))
                    }
                }
            }

            describe("Updating a cell") {
                beforeEach {
                    controller = MainViewController()
                    buttons = [UIButton](count: 9, repeatedValue: UIButton())
                    controller.gridButtons = buttons
                }
                context("when a cell is blank") {
                    it("alternates between adding an X and adding an O") {
                        controller.viewDidLoad()

                        controller.markCell(0)
                        controller.markCell(1)
                        controller.markCell(2)

                        expect(controller.gridButtons[0].titleForState(.Normal)).to(equal("X"))
                        expect(controller.gridButtons[1].titleForState(.Normal)).to(equal("O"))
                        expect(controller.gridButtons[2].titleForState(.Normal)).to(equal("X"))

                    }
                }

                context("when a cell is marked") {
                    it("does not change the value in the cell") {
                        controller.viewDidLoad()
                        controller.markCell(0)
                        controller.markCell(0)

                        expect(controller.gridButtons[0].titleForState(.Normal)).to(equal("X"))
                    }
                }
            }
        }
    }
}
