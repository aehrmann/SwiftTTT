var str = "Hello, playground"

enum Mark: String, Printable {
    case X = "X"
    case O = "O"
    case Blank = "_"
    
    var description: String {
        return String(self.rawValue)
    }
}

//typealias Move = (Mark, Int)
//
//struct Board {
//    let moves: [Move] = [Move]()
//    
//}
//
//Board.init(string: "hf|fds")
//Board.init()
//board.with(mark: Mark, addedAt position: Int) -> Board
//
//
//
//str

//let marks = "XXX___OOO".filter { $0 != "|" }


func markForCharacter(char: String) -> Mark {
    return Mark(rawValue: char)!
}

println(markForCharacter("X"))

//split(.characters) { $0 == "" }
let expectedRows: [[Mark]] = [[.X, .O, .X],
    [.X, .X, .O],
    [.O, .O, .X]]
expectedRows[0][1] 




func removeFirst(n: Int, var of marks: [Mark]) -> [Mark] {
    var result = [Mark]()
    for _ in 0..<n {
        result.append(marks.removeAtIndex(0))
    }
    return result
}

func elements<T>(var of arr: [T], from start: Int, by count: Int) -> [T] {
    var result = Array<T>()
    for _ in 0..<start {
        arr = Array(dropFirst(arr))
    }
    for _ in 0..<count {
        result.append(arr.removeAtIndex(0))
    }
    return result
}

elements(of: [1, 2, 3, 4], from: 2, by: 2)
