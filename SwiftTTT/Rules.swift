public struct Rules {
    public let player = Mark.X
    public let opponent = Mark.O
    
    public init() { }

    public func playerWins(board: Board) -> Bool {
        return isWinningMark(mark: player, on: board)
    }
    
    public func opponentWins(board: Board) -> Bool {
        return isWinningMark(mark: opponent, on: board)
    }
    
    public func isWinningMark(mark aMark: Mark, on board: Board) -> Bool {
        for row in self.rows(board) {
            if rowWinsFor(mark: aMark, row: row) {
                return true
            }
        }
        return false
    }

    private func rows(board: Board) -> [[Mark]] {
        return board.rows()
    }
    
    private func rowWinsFor(mark aMark: Mark, row: [Mark]) -> Bool {
        return row.reduce(true) { result, mark in
            result && aMark == mark
        }
    }
}