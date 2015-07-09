import UIKit

public class GameViewController: UICollectionViewController {

    public var board: Board!
    public var rules: Rules!

    override public func viewDidLoad() {
        super.viewDidLoad()
        self.board = Board()
        self.rules = Rules()
    }

    override public func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }

    override public func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("BoardCell", forIndexPath: indexPath) as! UICollectionViewCell
        return cell
    }
}