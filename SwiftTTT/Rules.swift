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
 
    public func isDraw(board: Board) -> Bool {
        var full = true
        for i in 0..<9 {
            full = full && board.isMarked(at: i)
        }
        return full && !(playerWins(board) || opponentWins(board))
    }
    
    public func isWinningMark(mark aMark: Mark, on board: Board) -> Bool {
        return hasWinningSetFor(board.rows(), mark: aMark) || hasWinningSetFor(board.columns(), mark: aMark) || hasWinningSetFor(board.diagonals(), mark: aMark)
    }
    
    private func setWinsFor(set: [Mark], mark: Mark) -> Bool {
        return set.reduce(true) { result, nextMark in
            result && nextMark == mark
        }
    }
    
    private func hasWinningSetFor(sets: [[Mark]], mark: Mark) -> Bool {
        return sets.reduce(false) { result, set in
            result || setWinsFor(set, mark: mark)
        }
    }
}