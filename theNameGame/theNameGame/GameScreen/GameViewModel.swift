import Foundation

protocol GameViewModelDelegate: AnyObject {
    
}

protocol GameViewModelInterface {
    var delegate: GameViewModelDelegate? { get set }

    func fetchCollaborators()
}

class GameViewModel: GameViewModelInterface {
    weak var delegate: GameViewModelDelegate?
    let worker: GameWorkerInterface
    var dataStore: CollaboratorsDataStoreInterface

    init(worker: GameWorkerInterface = GameWorker(),
         dataStore: CollaboratorsDataStoreInterface = CollaboratorsDataStore()) {
        self.worker = worker
        self.dataStore = dataStore
    }

    func fetchCollaborators() {
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
