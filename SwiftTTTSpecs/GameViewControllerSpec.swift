import Quick
import Nimble
import SwiftTTT

class GameViewControllerSpec: QuickSpec {
    override func spec() {
        func createCollectionView() -> UICollectionView {
            let layout = UICollectionViewFlowLayout()
            let rect = CGRect()
            let view = UICollectionView(frame: rect, collectionViewLayout: layout)
            return view
        }

        describe("GameViewController") {

            describe("Loading the view") {
                var controller: GameViewController!
                var layout: UICollectionViewLayout!
                var rect: CGRect!
                var collection: UICollectionView!

                beforeEach {
                    controller = GameViewController()
                    layout = UICollectionViewFlowLayout()
                    rect = CGRect()
                    collection = UICollectionView(frame: rect, collectionViewLayout: layout)
                    controller.collectionView = collection

                    controller.viewDidLoad()
                }

                it("constructs a board") {
                    expect(controller.board).notTo(beNil())
                }

                it("constructs the rules for the game") {
                    expect(controller.rules).notTo(beNil())
                }

                it("sets itself as the collection view's data source") {
                    expect(controller.collectionView?.dataSource).to(beIdenticalTo(controller))
                }

                it("sets itself as the collection view's delegate") {
                    expect(controller.collectionView?.delegate).to(beIdenticalTo(controller))
                }
            }
        }
    }
}