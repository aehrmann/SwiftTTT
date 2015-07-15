public struct Board {
    public let marks: [Mark]
    
    public init() {
        self.init(marks: [Mark](count: 9, repeatedValue: Mark.Blank))
    }
    public init(marks: [Mark]) {
        self.marks = marks
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

}