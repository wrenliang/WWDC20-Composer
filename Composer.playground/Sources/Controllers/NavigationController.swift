import Foundation
import UIKit

public class NavigationController: UINavigationController {
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.isHidden = true
    }
}
