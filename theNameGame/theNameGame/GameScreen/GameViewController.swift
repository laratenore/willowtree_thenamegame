import UIKit

class GameViewController: UIViewController {
    private var viewModel: GameViewModelInterface
    private var customView: UIView & GameViewInterface
    
    init(viewModel: GameViewModelInterface = GameViewModel(),
         customView: UIView & GameViewInterface = GameView()) {
        self.customView = customView
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.customView.delegate = self
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.customView.build()
    }
    
    override func loadView() {
        self.view = self.customView
    }
}

extension GameViewController: GameViewDelegate {
    
}

extension GameViewController: GameViewModelDelegate {
    
}
