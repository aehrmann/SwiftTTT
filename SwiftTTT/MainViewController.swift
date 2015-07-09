import UIKit

public class MainViewController: UIViewController {

    @IBOutlet public var gridButtons: Array<UIButton>!

    private var nextMark = "X"

    override public func viewDidLoad() {
        super.viewDidLoad()
        for button in gridButtons {
            button.setTitle("_", forState: .Normal)
        }
    }

    public func markCell(cellIndex: Int) {
        if gridButtons[cellIndex].titleForState(.Normal) == "_" {
            gridButtons[cellIndex] = UIButton()
            gridButtons[cellIndex].setTitle(nextMark, forState: .Normal)
            nextMark = nextMark == "X" ? "O" : "X"
        }

    }
}