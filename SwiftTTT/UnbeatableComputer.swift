public class UnbeatableComputer {

    public let mark = Mark.O
    public let rules = Rules()
    
    private let userMark = Mark.X
    private var bestMove = 0
    
    public init() { }
    
    public func nextMove(board: Board) -> Int {
        var nextBoard: Board!
        
        for spot in board.openSpots() {
            if hasWin(board, spot: spot) || blocks(board, spot: spot) {
                return spot
            }
            if canFork(board, spot: spot) {
                return spot
            }
        }
        
        return -1
    }
    
    private func canFork(board: Board, spot: Int) -> Bool {
        return numberPossibleComputerWins(board.marked(with: self.mark, at: spot)) == 2
    }
    
    private func numberPossibleComputerWins(board: Board) -> Int {
        var numberOfWins = 0
        for spot in board.openSpots() {
            if rules.opponentWins(board.marked(with: self.mark, at: spot)) {
                numberOfWins += 1
            }
        }
        return numberOfWins
    }
    
    private func numberPossibleUserWins(board: Board) -> Int {
        var numberOfWins = 0
        for spot in board.openSpots() {
            if rules.playerWins(board.marked(with: userMark, at: spot)) {
                numberOfWins += 1
            }
        }
        return numberOfWins
    }
    
    private func hasWin(board: Board, spot: Int) -> Bool {
        return computerWins(board.marked(with: self.mark, at: spot))
    }
    
    private func blocks(board: Board, spot: Int) -> Bool {
        return userWins(board.marked(with: userMark, at: spot))
    }

    
    private func userWins(board: Board) -> Bool {
        return rules.playerWins(board)
    }
    
    private func computerWins(board: Board) -> Bool {
        return rules.opponentWins(board)
    }
}