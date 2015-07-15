public class MutableBoard {
    var marks = [Mark](count: 9, repeatedValue: Mark.Blank)
    let rules = Rules()

    public init() { }

    public func placeMark(mark: Mark, at position: Int) {
        marks[position] = mark
    }

    public func markAt(position: Int) -> Mark {
        return marks[position]
    }

    public func hasMark(mark: Mark, atPositions positions: [Int]) -> Bool {
        for position in positions {
            if markAt(position) != mark {
                return false
            }
        }
        return true
    }

    public func isFull() -> Bool {
        for mark in marks {
            if mark == .Blank {
                return false
            }
        }
        return true
    }

    public func isEmpty() -> Bool {
        for mark in marks {
            if mark != .Blank {
                return false
            }
        }
        return true
    }
}