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
                func createButtons() -> [UIButton] {
                    var buttons = [UIButton]()
                    for i in 0..<9 {
                        buttons.append(UIButton())
                    }
                    return buttons
                }

                context("when a cell is blank") {
                    let controller = MainViewController()
                    controller.gridButtons = createButtons()
                    controller.viewDidLoad()

                    it("adds an X to the first only") {
                        controller.markCell(0)
                        expect(controller.gridButtons[0].titleForState(.Normal)).to(equal("X"))
                    }

                    it("adds an O to the second cell") {
                        controller.markCell(1)
                        expect(controller.gridButtons[1].titleForState(.Normal)).to(equal("O"))
                    }

                    it("adds an X to the third cell") {
                        controller.markCell(2)
                        expect(controller.gridButtons[2].titleForState(.Normal)).to(equal("X"))
                    }

                    it("adds an O to the fourth cell") {
                        controller.markCell(3)
                        expect(controller.gridButtons[1].titleForState(.Normal)).to(equal("O"))
                    }
                }

                context("when a cell is marked") {
                    it("does not change the value in the cell") {
                        let controller = MainViewController()
                        controller.gridButtons = createButtons()
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
