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
                    context("when the cell is empty") {
                        beforeEach {
                            controller.userTurn(0)
                        }
                        
                        it("updates the given position with an X") {
                            expect(controller.board.markAt(0)).to(equal(Mark.X))
                        }
                        
                        it("changes the cell's button text to X") {
                            expect(controller.buttonTextIsX(at: 0)).to(beTrue())
                        }
                        
                        it("changes the active player to the computer") {
                            expect(controller.nextMark).to(equal(Mark.O))
                        }
                    }
                    
                    context("when the cell is not empty") {
                        beforeEach {
                            controller.computerTurn()
                            controller.userTurn(0)
                        }
                        
                        it("does not change the corresponding mark on the board") {
                            expect(controller.board.markAt(0)).to(equal(Mark.O))
                        }
                        
                        it("does not change the text of the button") {
                            expect(controller.buttonTextIsO(at: 0)).to(beTrue())
                        }
                    }
                }
                
                context("when it is the opponent's turn") {
                    beforeEach {
                        controller.userTurn(0)
                        controller.computerTurn()
                    }
                    
                    it("adds an O to the first open position") {
                        expect(controller.board.markAt(1)).to(equal(Mark.O))
                    }
                    
                    it("changes the cell's button text to O") {
                        expect(controller.buttonTextIsO(at: 1)).to(beTrue())
                    }
                    
                    it("changes the active player to the user") {
                        expect(controller.nextMark).to(equal(Mark.X))
                    }
                }
            }
            
            describe("Displaying the winner") {
                var controller: MainViewController!
                var label: UILabel!
                
                beforeEach {
                    controller = MainViewController()
                    controller.gridButtons = createButtons()
                    label = UILabel()
                    controller.winnerLabel = label
                    controller.viewDidLoad()
                }

                context("when X wins") {
                    it("displays that X is the winner") {
                        controller.userTurn(0)
                        controller.userTurn(1)
                        controller.userTurn(2)

                        expect(controller.winnerLabel.text).to(equal("X is the winner!"))
                    }
                }

                context("when O wins") {
                    it("displays that O is the winner") {
                        controller.computerTurn()
                        controller.computerTurn()
                        controller.computerTurn()

                        expect(controller.winnerLabel.text).to(equal("O is the winner!"))
                    }
                }

                context("there is a draw") {
                    func playDrawMoves(controller: MainViewController) {
                        controller.userTurn(1)
                        controller.userTurn(3)
                        controller.userTurn(4)
                        controller.userTurn(8)
                        controller.computerTurn()
                        controller.computerTurn()
                        controller.computerTurn()
                        controller.computerTurn()
                        controller.computerTurn()
                    }

                    it("displays that there is a draw") {
                        playDrawMoves(controller)

                        expect(controller.winnerLabel.text).to(equal("Draw game!"))
                    }
                }
            }
        }
    }
}
