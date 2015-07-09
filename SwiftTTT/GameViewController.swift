import UIKit

public class GameViewController: UICollectionViewController {

    public var board: Board!
    public var rules: Rules!

    override public func viewDidLoad() {
        super.viewDidLoad()
        board = Board()
        rules = Rules()
    }
}