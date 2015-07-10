import UIKit

public class MainViewController: UIViewController {

    @IBOutlet public var gridButtons: Array<UIButton>!
    @IBOutlet weak var winnerLabel: UILabel!

    private var xHasMove = true

    public var board: Board!
    public var rules: Rules!

    override public func viewDidLoad() {
        board = Board()
        rules = Rules()
        for button in gridButtons {
            setText(button, mark: "")
        }
        super.viewDidLoad()
    }

    @IBAction func buttonPressed(sender: UIButton) {
        let cellIndex = find(gridButtons, sender)!
        updateCell(cellIndex)
    }

    public func updateCell(cellIndex: Int) {
        let button = gridButtons[cellIndex]
        if isUnmarked(button) {
            setText(button, mark: nextMark())
        }
    }

    private func isUnmarked(button: UIButton) -> Bool {
        return button.titleForState(.Normal)! == ""
    }

    private func nextMark() -> String {
        let mark = xHasMove ? "X" : "O"
        xHasMove = !xHasMove
        return mark
    }

    private func setText(button: UIButton, mark: String) {
        button.setTitle(mark, forState: .Normal)
    }
}