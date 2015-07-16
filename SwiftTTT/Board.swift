public struct Board {
    public let marks: [Mark]
    
    public init() {
        self.init(marks: [Mark](count: 9, repeatedValue: Mark.Blank))
    }
    
    public init(marks: [Mark]) {
        self.marks = marks
    }
    
    public init(state: String) {
        let characters = map(state) { $0 }
        let filteredCharacters = filter(characters) { $0 != "|" }
        self.marks = map(filteredCharacters) { Mark(rawValue: $0)! }
    }
    
    public func marked(with mark: Mark, at spot: Int) -> Board {
        var newMarks = self.marks
        newMarks[spot] = mark
        return Board.init(marks: newMarks)
    }
    
    public func isEmpty() -> Bool {
        return self.marks.reduce(true) { result, mark in
            return result && mark == Mark.Blank
        }
    }
    
    public func isFull() -> Bool {
        return self.marks.reduce(true) { result, mark in
            return result && mark != .Blank
        }
    }
    
    public func openSpots() -> [Int] {
        return Array(0..<9).filter { !self.isMarked(at: $0) }
    }

    
    public func isMarked(at spot: Int) -> Bool {
        return self.marks[spot] != Mark.Blank
    }
    
    public func markAt(spot: Int) -> Mark {
        return self.marks[spot]
    }
    
    public func rows() -> [[Mark]] {
        return markSets(byIndices: { $0 / 3 })
    }
    
    public func columns() -> [[Mark]] {
        return markSets(byIndices: { $0 % 3 })
    }
    
    public func diagonals() -> [[Mark]] {
        var sets = Array(count: 2, repeatedValue: Array<Mark>())

        sets[0] = [markAt(0), markAt(4), markAt(8)]
        sets[1] = [markAt(2), markAt(4), markAt(6)]
        
        return sets
    }
    
    public func markSets(byIndices indexer: Int -> Int) -> [[Mark]] {
        var sets = Array(count: 3, repeatedValue: Array<Mark>())
        
        for i in 0..<9 {
            sets[indexer(i)].append(markAt(i))
        }
    
        return sets
    }
}

