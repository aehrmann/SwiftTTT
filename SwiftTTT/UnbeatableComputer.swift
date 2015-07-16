public class UnbeatableComputer {

    public let mark = Mark.O
    public let rules = Rules()
    private var bestMove = 0
    
    public init() { }
    
    public func nextMove(board: Board) -> Int {
        self.minimaxScore(board, isComputerTurn: true, depth: 0)

        return self.bestMove
    }
    
    private func minimaxScore(board: Board, isComputerTurn: Bool, depth: Int) -> Int {
        if board.isFull() {
            return score(board, depth: depth)
        }
        
        var spots = [Int]()
        var scores = [Int]()

        for spot in board.openSpots() {

            let nextMark = isComputerTurn ? Mark.O : Mark.X
            let nextBoard = board.marked(with: nextMark, at: spot)
            let scoreValue = self.minimaxScore(nextBoard, isComputerTurn: !isComputerTurn, depth: depth + 1)
            
            spots.append(spot)
            scores.append(scoreValue)
        }
        
        if isComputerTurn {
            let maxScore = scores.reduce(Int.min) { max($0, $1) }
            self.bestMove = spots[find(scores, maxScore)!]
            return maxScore
        } else {
            let minScore = scores.reduce(Int.max) { min($0, $1) }
            self.bestMove = spots[find(scores, minScore)!]
            return minScore
        }
    }
    
    private func score(board: Board, depth: Int) -> Int {
        if computerWins(board) {
            return 10 - depth
        } else if userWins(board) {
            return depth - 10
        } else {
            return 0
        }
    }

    private func userWins(board: Board) -> Bool {
        return rules.playerWins(board)
    }
    
    private func computerWins(board: Board) -> Bool {
        return rules.opponentWins(board)
    }
}