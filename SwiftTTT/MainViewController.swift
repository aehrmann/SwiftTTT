import UIKit

public class MainViewController: UIViewController {

    @IBOutlet public var gridButtons: Array<UIButton>!
    @IBOutlet public weak var winnerLabel: UILabel!

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

    public func xIsWinner() -> Bool {
        return rules.playerWins(board)
    }

    public func oIsWinner() -> Bool {
        return rules.opponentWins(board)
    }

    public func gameIsDraw() -> Bool {
        return rules.isDraw(board)
    }

    @IBAction func buttonPressed(sender: UIButton) {
        if let position = find(gridButtons, sender) {
            updatePosition(position)
        }
    }

    public func updatePosition(position: Int) {
        if isBlank(position) {
            board = board.marked(with: nextMark, at: position)
            setTextForPosition(position)

            checkWinOrDraw()

            nextMark = nextMark == .X ? .O : .X
        }
    }

    private func checkWinOrDraw() {
        if rules.playerWins(board) {
            winnerLabel?.text = "X is the winner!"
        } else if rules.opponentWins(board) {
            winnerLabel?.text = "O is the winner!"
        } else if rules.isDraw(board) {
            winnerLabel?.text = "Draw game!"
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