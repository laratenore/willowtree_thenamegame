import Foundation

typealias Collaborators = [Collaborator]

// MARK: - Collaborator
struct Collaborator: Codable {
    let firstName: String
    let lastName: String
    let headshot: Headshot
    let id: String
}

// MARK: - Headshot
struct Headshot: Codable {
    let alt: String
    let height: Int?
    let width: Int?
    let id: String
    let mimeType: MIMEType?
    let url: String?
}

enum MIMEType: String, Codable {
    case imageJPEG = "image/jpeg"
    case imagePNG = "image/png"
}
