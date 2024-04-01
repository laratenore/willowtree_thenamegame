import UIKit

class GameViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        let worker = GameWorker()
        worker.fetchCollaborators { result in
            switch result {
            case .success(let collaborators):
                print(collaborators)
            case .failure(let error):
                print(error)
            }
        }
    }
}
