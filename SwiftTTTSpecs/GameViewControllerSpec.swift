import Quick
import Nimble
import SwiftTTT

class GameViewControllerSpec: QuickSpec {
    override func spec() {

        func createTestCollectionView() -> UICollectionView {
            let collectionViewLayout = UICollectionViewFlowLayout()
            let aFrame = CGRect()
            let collectionView = UICollectionView(frame: aFrame, collectionViewLayout: collectionViewLayout)
            return collectionView
        }

        describe("GameViewController") {
            var controller: GameViewController!
            var collectionView: UICollectionView!

            describe("Loading the view") {
                beforeEach {
                    controller = GameViewController()
                    collectionView = createTestCollectionView()
                    controller.boardCollectionView = collectionView

                    controller.viewDidLoad()
                }

                it("constructs a board") {
                    expect(controller.board).notTo(beNil())
                }

                it("constructs the rules for the game") {
                    expect(controller.rules).notTo(beNil())
                }

                it("sets its collection view's data source") {
                    expect(controller.boardCollectionView.dataSource).to(beIdenticalTo(controller))
                }
            }
        }
    }
}