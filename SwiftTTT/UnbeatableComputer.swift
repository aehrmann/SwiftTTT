public class UnbeatableComputer {
    public let mark: Mark = .O
    public let rules = Rules()
    
    public init() { }
    
    public func nextMove(board: Board) -> Int {
        var openPositions = Array(0..<9).filter { !board.isMarked(at: $0) }
        var nextBoard: Board!
        let rules = Rules()
        
        for position in openPositions {
            nextBoard = board.marked(with: Mark.O, at: position)
            
            if rules.opponentWins(nextBoard) {
                return position
            }
            
            nextBoard = board.marked(with: Mark.X, at: position)
            if rules.playerWins(nextBoard) {
                return position
            }
        }
        return 0
    }

}