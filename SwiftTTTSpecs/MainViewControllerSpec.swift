import Quick
import Nimble
import SwiftTTT

class MainViewControllerSpec: QuickSpec {
    override func spec() {

        func createButtons() -> [UIButton] {
            var buttons = [UIButton]()
            for i in 0..<9 {
                buttons.append(UIButton())
            }
            return buttons
        }

        describe("MainViewController") {
            var controller: MainViewController!

            describe("Loading the view") {

                beforeEach {
                    controller = MainViewController()
                    controller.gridButtons = createButtons()
                    controller.viewDidLoad()
                }

                it("sets all grid buttons to blank state") {
                    for button in controller.gridButtons {
                        expect(button.titleForState(.Normal)).to(equal(""))
                    }
                }

                it("creates a board") {
                    expect(controller.board).notTo(beNil())
                }

                it("creates a the rules") {
                    expect(controller.rules).notTo(beNil())
                }
                
                it("sets the user to be the active player") {
                    expect(controller.nextMark).to(equal(Mark.X))
                }
            }

            describe("Taking turns") {
                var controller: MainViewController!
                
                beforeEach {
                    controller = MainViewController()
                    controller.gridButtons = createButtons()
                    controller.viewDidLoad()
                }
                
                context("when it is the user's turn") {
                    it("updates the given position with an X") {
                        controller.userTurn(0)
                        
                        expect(controller.board.markAt(0)).to(equal(Mark.X))
                    }
                    
                    it("changes the active player to the computer") {
                        controller.userTurn(0)
                        
                        expect(controller.nextMark).to(equal(Mark.O))
                    }
                }
                
                context("when it is the opponent's turn") {
                    it("adds an O to the first open position") {
                        controller.userTurn(0)
                        controller.computerTurn()
                        
                        expect(controller.board.markAt(1)).to(equal(Mark.O))
                    }
                    
                    it("changes the active player to the user") {
                        controller.userTurn(0)
                        controller.computerTurn()
                        
                        expect(controller.nextMark).to(equal(Mark.X))
                    }

                }
            }
            
            describe("Updating the board") {
                var controller: MainViewController!

                beforeEach {
                    controller = MainViewController()
                    controller.gridButtons = createButtons()
                    controller.viewDidLoad()
                }

                context("when the cell is not marked") {
                    context("when an X is placed in a cell") {
                        beforeEach {
                            controller.updatePosition(0)
                        }

                        it("updates the corresponding position on the board") {
                            expect(controller.board.markAt(0)).to(equal(Mark.X))
                        }

                        it("changes the cell's button text to X") {
                            expect(controller.buttonTextIsX(at: 0)).to(beTrue())
                        }
                    }

                    context("when an O is placed in a cell") {
                        beforeEach {
                            controller.updatePosition(0)
                            controller.updatePosition(1)
                        }

                        it("updates the corresponding position on the board") {
                            expect(controller.board.markAt(1)).to(equal(Mark.O))
                        }

                        it("changes the cell's button text to O") {
                            expect(controller.buttonTextIsO(at: 1)).to(beTrue())
                        }
                    }
                }

                context("when the cell is already marked") {
                    beforeEach {
                        controller.updatePosition(0)
                        controller.updatePosition(0)
                    }

                    it("does not change the corresponding mark on the board") {
                        expect(controller.board.markAt(0)).to(equal(Mark.X))
                    }

                    it("does not change the text of the button") {
                        expect(controller.buttonTextIsX(at: 0)).to(beTrue())
                    }
                }
            }

            describe("Displaying the winner") {
                context("when X wins") {
                    func playXWinsMoves(controller: MainViewController) {
                        controller.updatePosition(0)
                        controller.updatePosition(8)
                        controller.updatePosition(3)
                        controller.updatePosition(7)
                        controller.updatePosition(6)
                    }

                    it("displays that X is the winner") {
                        let controller = MainViewController()
                        controller.gridButtons = createButtons()
                        let label = UILabel()
                        controller.winnerLabel = label
                        controller.viewDidLoad()

                        playXWinsMoves(controller)

                        expect(controller.winnerLabel.text).to(equal("X is the winner!"))
                    }
                }

                context("when O wins") {
                    func playOWinsMoves(controller: MainViewController) {
                        controller.updatePosition(0)
                        controller.updatePosition(2)
                        controller.updatePosition(1)
                        controller.updatePosition(5)
                        controller.updatePosition(4)
                        controller.updatePosition(8)
                    }

                    it("displays that O is the winner") {
                        let controller = MainViewController()
                        controller.gridButtons = createButtons()
                        let label = UILabel()
                        controller.winnerLabel = label
                        controller.viewDidLoad()

                        playOWinsMoves(controller)

                        expect(controller.winnerLabel.text).to(equal("O is the winner!"))
                    }
                }

                context("there is a draw") {
                    func playDrawMoves(controller: MainViewController) {
                        controller.updatePosition(0)
                        controller.updatePosition(2)
                        controller.updatePosition(1)
                        controller.updatePosition(3)
                        controller.updatePosition(5)
                        controller.updatePosition(4)
                        controller.updatePosition(6)
                        controller.updatePosition(8)
                        controller.updatePosition(7)
                    }

                    it("displays that there is a draw") {
                        let controller = MainViewController()
                        controller.gridButtons = createButtons()
                        let label = UILabel()
                        controller.winnerLabel = label
                        controller.viewDidLoad()

                        playDrawMoves(controller)

                        expect(controller.winnerLabel.text).to(equal("Draw game!"))
                    }
                }

            }
        }
    }
}
