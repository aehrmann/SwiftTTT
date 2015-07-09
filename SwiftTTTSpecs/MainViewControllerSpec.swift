import Quick
import Nimble
import SwiftTTT

class MainViewControllerSpec: QuickSpec {
    override func spec() {

        describe("MainViewController") {

            describe("Loading the view") {
                it("has its cell in a blank state") {
                    let controller = MainViewController()
                    let label = UILabel()
                    controller.cellLabel = label

                    controller.viewDidLoad()

                    expect(controller.cellLabel.text).to(equal("_"))
                }
            }
        }
    }
}
