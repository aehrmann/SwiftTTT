import Quick
import Nimble
import SwiftTTT

class MainViewControllerSpec: QuickSpec {
    override func spec() {

        describe("MainViewController") {

            describe("Loading the view") {
                it("sets both cells to a blank state") {
                    let controller = MainViewController()
                    let button = UIButton()
                    let buttonTwo = UIButton()
                    controller.cellButton = button
                    controller.cellButtonTwo = buttonTwo

                    controller.viewDidLoad()

                    expect(controller.cellButton.titleLabel?.text).to(equal("_"))
                    expect(controller.cellButtonTwo.titleLabel?.text).to(equal("_"))
                }
            }

            describe("Updating a button's lable") {
                var controller: MainViewController!
                var button: UIButton!
                var buttonTwo: UIButton!

                context("when the button is first to be pressed") {
                    beforeEach {
                        controller = MainViewController()
                        button = UIButton()
                        buttonTwo = UIButton()

                        controller.cellButton = button
                        controller.cellButtonTwo = buttonTwo

                        controller.viewDidLoad()
                    }

                    it("changes the text of the first button to X") {
                        controller.updateButton(0)

                        expect(controller.cellButton.titleLabel?.text).to(equal("X"))
                    }
                    it("changes the text of the second button to X") {
                        controller.updateButton(1)

                        expect(controller.cellButtonTwo.titleLabel?.text).to(equal("X"))
                    }
                }

                context("when the button is second to be pressed") {
                    beforeEach {
                        controller = MainViewController()
                        button = UIButton()
                        buttonTwo = UIButton()

                        controller.cellButton = button
                        controller.cellButtonTwo = buttonTwo

                        controller.viewDidLoad()
                    }

                    it("changes the text of the first button to O") {
                        controller.updateButton(1)
                        controller.updateButton(0)

                        expect(controller.cellButton.titleLabel?.text).to(equal("O"))
                    }
                    it("changes the text of the second button to O") {
                        controller.updateButton(0)
                        controller.updateButton(1)

                        expect(controller.cellButtonTwo.titleLabel?.text).to(equal("O"))
                    }
                }
            }
        }
    }
}
