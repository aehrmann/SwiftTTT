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
    
    @IBAction public func cellTapped(sender: UIButton) {
        if nextMark == Mark.X {
            let position = find(gridButtons, sender)!
            if board.isBlank(position) {
                userTurn(position)
                computerTurn()
            }
        }
    }

    public func userTurn(position: Int) {
        if board.isBlank(position) {
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
                break
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
    
    private func checkWinOrDraw() {
        if rules.playerWins(board) {
            winnerLabel?.text = "X is the winner!"
        } else if rules.opponentWins(board) {
            winnerLabel?.text = "O is the winner!"
        } else if rules.isDraw(board) {
            winnerLabel?.text = "Draw game!"
        }
    }
}