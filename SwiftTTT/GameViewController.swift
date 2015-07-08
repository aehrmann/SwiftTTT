import UIKit

public class GameViewController: UICollectionViewController {

    @IBOutlet public weak var boardCollectionView: UICollectionView!

    public var board: Board?
    public var rules: Rules?

    override public func viewDidLoad() {
        super.viewDidLoad()
        board = Board()
        rules = Rules()
        boardCollectionView.dataSource = self
    }
}