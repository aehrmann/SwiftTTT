public class BasicRules {
    public let player = "X"
    public let opponent = "O"
    
    private let winningXSet = "XXX"
    
    public init() {}
    
    public func playerWins(board: String) -> Bool {
        
        if any(self.rows(board), predicate: { self.isWinningXSet($0) }) {
            return true
        }
        if any(self.columns(board), predicate: { self.isWinningXSet($0) }) {
            return true
        }
        
        if board[0] == "X" && board[4] == "X" && board[8] == "X" {
            return true
        }
        if board[0] == "X" && board[4] == "X" && board[8] == "X" {
            return true
        }

        return false
    }
    
    private func isWinningXSet(s: String) -> Bool {
        return s == self.winningXSet
    }
    
    private func any(strings: [String], predicate: String -> Bool) -> Bool {
        for s in strings {
            if predicate(s) {
                return true
            }
        }
        return false
    }
    
    private func rows(board: String) -> [String] {
        return Array(0..<3).map { return self.row($0, of: board) }
    }
    
    private func columns(board: String) -> [String] {
        return Array(0..<3).map { return self.column($0, of: board) }
    }
    
    private func row(n: Int, of board: String) -> String {
        let start = n * 3
        let end = (n + 1) * 3
        return board[start..<end]
    }
    
    private func column(n: Int, of board: String) -> String {
        var substring = ""
        for i in 0..<count(board) {
            if i % 3 == n {
                substring += board[i]
            }
        }
        return substring
    }
}

extension String {
    subscript (i: Int) -> String {
        return String(self[advance(startIndex, i)])
    }
    subscript(range: Range<Int>) -> String {
        return self[advance(startIndex, range.startIndex)..<advance(startIndex, range.endIndex)]
    }
}
