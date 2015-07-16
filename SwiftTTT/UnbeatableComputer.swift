public class UnbeatableComputer {
    public let mark: Mark = .O
    public let rules = Rules()
    
    public init() { }
    
    public func nextMove(board: Board) -> Int {
        var nextMove = moveToWinOrBlockNextTurn(board)
        if isValidMove(nextMove) {
            return nextMove
        }
        
        nextMove = moveThatCreatesFork(board)
        if isValidMove(nextMove) {
            return nextMove
        }
        return -1
    }
    
    private func isValidMove(move: Int) -> Bool {
        return move >= 0
    }
    
    private func moveThatCreatesFork(board: Board) -> Int {
        var numberOfPossibleWins = 0
        var nextBoard: Board!
        var nextNextBoard: Board!
        
        for position in openPositions(board) {
            
            numberOfPossibleWins = 0
            
            nextBoard = nextComputerBoard(board, position: position)
            
            for nextPosition in openPositions(nextBoard) {
                
                nextNextBoard = nextComputerBoard(nextBoard, position: nextPosition)

                if computerWins(nextNextBoard) {
                    numberOfPossibleWins += 1
                }
                
                if numberOfPossibleWins == 2 {
                    return position
                }
            }
        }
        return -1
    }

    private func moveToWinOrBlockNextTurn(board: Board) -> Int {
        var nextBoard: Board!
        
        for position in openPositions(board) {
            if computerWins(nextComputerBoard(board, position: position)) || userWins(nextUserBoard(board, position: position)) {
                return position
            }
        }
        return -1

    }
    
    private func nextUserBoard(board: Board, position: Int) -> Board {
        return board.marked(with: Mark.X, at: position)
    }
    
    private func nextComputerBoard(board: Board, position: Int) -> Board {
        return board.marked(with: Mark.O, at: position)
    }
    
    private func openPositions(board: Board) -> [Int] {
        return Array(0..<9).filter { !board.isMarked(at: $0) }
    }
    private func userWins(board: Board) -> Bool {
        return rules.playerWins(board)
    }
    
    private func computerWins(board: Board) -> Bool {
        return rules.opponentWins(board)
    }
}