public class UnbeatableComputer {
    public let mark: Mark = .O
    
    public init() { }
    
    public func nextMove(board: MutableBoard) -> Int {
        var openPositions = Array(0..<9).filter { board.isBlank($0) }
        var nextBoard: MutableBoard!
        let rules = BasicRules()
        
        for position in openPositions {
            nextBoard = createNextBoard(with: self.mark, at: position, on: board)
            
            if rules.markIsWinner(self.mark, of: nextBoard) {
                return position
            }
            
            nextBoard = createNextBoard(with: .X, at: position, on: board)
            
            if rules.markIsWinner(.X, of: nextBoard) {
                return position
            }
        }
        return 0
    }
    
    private func createNextBoard(with mark: Mark, at position: Int, on board: MutableBoard) -> MutableBoard {
        var nextBoard = MutableBoard()
        for i in 0..<9 {
            nextBoard.placeMark(board.markAt(i), at: i)
        }
        nextBoard.placeMark(mark, at: position)
        return nextBoard
    }
    
}