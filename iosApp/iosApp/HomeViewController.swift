import UIKit
import shared

class HomeViewController : UIViewController {

    private let button = UIButton()

    override func viewDidLoad() {
        view.backgroundColor = .white
        view.addSubview(button)

        button.setTitle("Press me", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.frame.size.width = 200
        button.frame.size.height = 50
        button.center = self.view.center

        button.addTarget(self, action: #selector(didButtonClick), for: .touchUpInside)
    }

    @objc func didButtonClick(_ sender: UIButton) {
        let otherViewController = OtherViewController()
        navigationController?.pushViewController(otherViewController, animated: true)
    }
}
