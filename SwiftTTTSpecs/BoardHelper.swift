import SwiftTTT

func boardWithMarksAtPositions(markSets: [Mark: [Int]]) -> Board {
    let board = Board()
    for (mark, positions) in markSets {
        for position in positions {
            board.placeMark(mark, at: position)
        }
    }
    return board
}