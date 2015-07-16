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
        var allRows = Array<[Mark]>()

        var row = [Mark]()
        for i in 0..<9 {
            row.append(board.markAt(i))
            if i % 3 == 2 {
                allRows.append(row)
                row = [Mark]()
            }
        }
        return allRows
    }
    
    private func rowWinsFor(mark aMark: Mark, row: [Mark]) -> Bool {
        return row.reduce(true) { result, mark in
            result && aMark == mark
        }
    }
    
    private func rowWinsForPlayer(row: [Mark]) -> Bool {
        return row.reduce(true) { result, mark in
            result && mark == player
        }
    }

    private func rowWinsForOpponent(row: [Mark]) -> Bool {
        return row.reduce(true) { result, mark in
            result && mark == opponent
        }
    }
}