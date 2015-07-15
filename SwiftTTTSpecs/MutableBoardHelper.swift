import SwiftTTT

func mutableBoardWithMarksAtPositions(markSets: [Mark: [Int]]) -> MutableBoard {
    let board = MutableBoard()
    for (mark, positions) in markSets {
        for position in positions {
            board.placeMark(mark, at: position)
        }
    }
    return board
}