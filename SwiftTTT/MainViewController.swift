import UIKit

public class MainViewController: UIViewController {

    @IBOutlet public weak var cellLabel: UILabel!

    override public func viewDidLoad() {
        super.viewDidLoad()
        cellLabel.text = "_"
    }
}