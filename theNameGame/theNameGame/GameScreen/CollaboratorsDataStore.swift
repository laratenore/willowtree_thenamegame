import Foundation

protocol CollaboratorsDataStoreInterface {
    var collaborators: Collaborators { get set }
}

class CollaboratorsDataStore: CollaboratorsDataStoreInterface {
    var collaborators: Collaborators = []
}
