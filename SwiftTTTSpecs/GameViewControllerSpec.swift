import Quick
import Nimble
import SwiftTTT

class GameViewControllerSpec: QuickSpec {
    override func spec() {

        describe("GameViewController") {
            var controller: GameViewController!

            describe("Loading the view") {
                beforeEach {
                    controller = GameViewController()
                    controller.viewDidLoad()
                }

                it("constructs a board") {
                    expect(controller.board).notTo(beNil())
                }

                it("constructs the rules for the game") {
                    expect(controller.rules).notTo(beNil())
                }
            }

            describe("Playing the game") {
                it("shows 9 cells") {
                    controller = GameViewController()

                    let collectionView = UICollectionView(frame: CGRect(), collectionViewLayout:
                        UICollectionViewFlowLayout())
                    controller.collectionView = collectionView
                    controller.viewDidLoad()
                    controller.collectionView?.reloadData()
                    expect(collectionView.numberOfItemsInSection(0)).to(equal(9))
                }
            }
        }
    }
}