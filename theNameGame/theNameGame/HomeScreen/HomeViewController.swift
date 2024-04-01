import UIKit

class HomeViewController: UIViewController {
    private var customView: UIView & HomePageViewInterface
    
    init(customView: UIView & HomePageViewInterface = HomePageView()) {
        self.customView = customView
        super.init(nibName: nil, bundle: nil)
        self.customView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        self.view = self.customView
    }
}

extension HomeViewController: HomePageViewDelegate {
    func gameSelected() {
        let viewController = GameViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
