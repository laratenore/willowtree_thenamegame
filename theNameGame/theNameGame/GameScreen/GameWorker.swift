import Foundation

protocol GameWorkerInterface {
    func fetchCollaborators(completion: @escaping (Result<Collaborators, Error>) -> Void)
}

class GameWorker: GameWorkerInterface {
    func fetchCollaborators(completion: @escaping (Result<Collaborators, Error>) -> Void) {
        let url = URL(string: Constants.dataUrl)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                let error = NSError(domain: "No data", code: 0, userInfo: nil)
                completion(.failure(error))
                return
            }
            
            if let collaboratorsData = try? JSONDecoder().decode(Collaborators.self, from: data) {
                DispatchQueue.main.async {
                    completion(.success(collaboratorsData))
                }
            }
        }
        task.resume()
    }
}

private extension GameWorker {
    enum Constants {
        static let dataUrl = "https://namegame.willowtreeapps.com/api/v1.0/profiles"
    }
}
