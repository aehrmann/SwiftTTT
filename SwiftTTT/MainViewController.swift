import UIKit

public class MainViewController: UIViewController {

    @IBOutlet public var gridButtons: Array<UIButton>!

    private var xIsNext = true

    override public func viewDidLoad() {
        super.viewDidLoad()
        for button in gridButtons {
            button.setTitle("_", forState: .Normal)
        }
    }

    @IBAction func buttonPressed(sender: UIButton) {
        let cellIndex = find(gridButtons, sender)
        markCell(cellIndex!)
    }

    public func markCell(cellIndex: Int) {
        if gridButtons[cellIndex].titleForState(.Normal)! == "_" {
            if xIsNext {
                gridButtons[cellIndex].setTitle("X", forState: .Normal)
            } else {
                gridButtons[cellIndex].setTitle("O", forState: .Normal)
            }
            self.xIsNext = !self.xIsNext
        }

    }
}