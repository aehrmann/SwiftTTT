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
    
    public func isMarked(at spot: Int) -> Bool {
        return self.marks[spot] != Mark.Blank
    }
    
    public func markAt(spot: Int) -> Mark {
        return self.marks[spot]
    }
    
    public func rows() -> [[Mark]] {
        var allRows = Array<[Mark]>()
        
        var row = [Mark]()
        for i in 0..<9 {
            row.append(markAt(i))
            if i % 3 == 2 {
                allRows.append(row)
                row = [Mark]()
            }
        }
        return allRows

    }

}

