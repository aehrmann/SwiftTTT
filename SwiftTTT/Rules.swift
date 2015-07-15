public class Rules {
    private let rowWinningPositions = [[0, 1, 2], [3, 4, 5], [6, 7, 8]]
    private let columnWinningPositions = [[0, 3, 6], [1, 4, 7], [2, 5, 8]]
    private let diagonalWinningPositions = [[0, 4, 8], [2, 4, 6]]

    public let player: Mark!
    public let opponent: Mark!
    
    public init(player: Mark = Mark.X, opponent: Mark = Mark.O) {
        self.player = player
        self.opponent = opponent
    }

    public func markIsWinner(mark: Mark, of board: MutableBoard) -> Bool {
        return markWinsInAnySetOfPositions(mark, of: board)
    }

    public func isDraw(board: MutableBoard) -> Bool {
        return board.isFull() && !( markIsWinner(.O, of: board) || markIsWinner(.X, of: board) )
    }

    private func markWinsInAnySetOfPositions(mark: Mark, of board: MutableBoard) -> Bool {
        return markWinsRow(mark, of: board) || markWinsColumn(mark, of: board) || markWinsDiagonal(mark, of: board)
    }

    private func markWinsRow(mark: Mark, of board: MutableBoard) -> Bool {
        for positions in rowWinningPositions {
            if (board.hasMark(mark, atPositions: positions)) {
                return true
            }
        }
        return false
    }

    private func markWinsColumn(mark: Mark, of board: MutableBoard) -> Bool {
        for positions in columnWinningPositions {
            if (board.hasMark(mark, atPositions: positions)) {
                return true
            }
        }
        return false
    }

    private func markWinsDiagonal(mark: Mark, of board: MutableBoard) -> Bool {
        for positions in diagonalWinningPositions {
            if (board.hasMark(mark, atPositions: positions)) {
                return true
            }
        }
        return false
    }
}