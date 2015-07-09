import UIKit

public class MainViewController: UIViewController {

    @IBOutlet public weak var cellButton: UIButton!
    @IBOutlet public weak var cellButtonTwo: UIButton!

    private var buttonPresses = 0

    override public func viewDidLoad() {
        super.viewDidLoad()
        cellButton.setTitle("_", forState: UIControlState.Normal)
        cellButtonTwo.setTitle("_", forState: UIControlState.Normal)
    }


    @IBAction func updateButtonOne(sender: UIButton) {
        updateButton(0)
    }

    @IBAction func updateButtonTwo(sender: UIButton) {
        updateButton(1)
    }
    
    public func updateButton(buttonNumber: Int) {
        if buttonPresses % 2 == 0 {
            if buttonNumber == 0 {
                cellButton.setTitle("X", forState: UIControlState.Normal)
            } else if buttonNumber == 1 {
                cellButtonTwo.setTitle("X", forState: UIControlState.Normal)
            }
            buttonPresses++
        } else if buttonPresses % 2 == 1 {
            if buttonNumber == 0 {
                cellButton.setTitle("O", forState: UIControlState.Normal)
            } else if buttonNumber == 1 {
                cellButtonTwo.setTitle("O", forState: UIControlState.Normal)
            }
            buttonPresses++
        }
    }
}