import UIKit

public class MainViewController: UIViewController {

    @IBOutlet public var gridButtons: Array<UIButton>!
    @IBOutlet weak var winnerLabel: UILabel!

    private var nextMark = Mark.X

    public var board: Board!
    public var rules: Rules!

    override public func viewDidLoad() {
        board = Board()
        rules = Rules()
        for button in gridButtons {
            button.setTitle("", forState: .Normal)
        }
        super.viewDidLoad()
    }

    @IBAction func buttonPressed(sender: UIButton) {
        if let position = find(gridButtons, sender) {
            updatePosition(position)
        }
    }

    public func updatePosition(position: Int) {
        if isBlank(position) {
            board.placeMark(nextMark, at: position)
            setTextForPosition(position)
            nextMark = nextMark == .X ? .O : .X
        }
    }

    private func isBlank(position: Int) -> Bool {
        return board.markAt(position) == .Blank
    }

    private func setTextForPosition(position: Int) {
        let button = gridButtons[position]
        let markText = board.markAt(position).description
        button.setTitle(markText, forState: .Normal)
    }
}