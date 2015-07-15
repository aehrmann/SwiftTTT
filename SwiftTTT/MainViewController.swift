import UIKit

public class MainViewController: UIViewController {

    @IBOutlet public var gridButtons: Array<UIButton>!
    @IBOutlet public weak var winnerLabel: UILabel!

    public var nextMark = Mark.X

    public var board: MutableBoard!
    public var rules: Rules!

    override public func viewDidLoad() {
        board = MutableBoard()
        rules = Rules()
        for button in gridButtons {
            button.setTitle("", forState: .Normal)
        }
        super.viewDidLoad()
    }

    public func userTurn(position: Int) {
        if isBlank(position) {
            board.placeMark(.X, at: position)
            gridButtons[position].setTitle("X", forState: .Normal)
            nextMark = Mark.O
            checkWinOrDraw()
        }
    }
    
    public func computerTurn() {
        for i in 0..<board.marks.count {
            if board.markAt(i) == .Blank {
                board.placeMark(.O, at: i)
                gridButtons[i].setTitle("O", forState: .Normal)
            }
        }
        checkWinOrDraw()
        nextMark = Mark.X
    }
    
    public func buttonTextIsX(at position: Int) -> Bool {
        return gridButtons[position].titleForState(.Normal) == "X"
    }
    
    public func buttonTextIsO(at position: Int) -> Bool {
        return gridButtons[position].titleForState(.Normal) == "O"
    }
        
    public func xIsWinner() -> Bool {
        return rules.playerWins(board)
    }

    public func oIsWinner() -> Bool {
        return rules.playerWins(board)
    }

    public func gameIsDraw() -> Bool {
        return rules.isDraw(board)
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
}