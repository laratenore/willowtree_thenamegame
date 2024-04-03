import Foundation
import UIKit

protocol CollaboratorCollectionViewCellDelegate: AnyObject {
    
}

final class CollaboratorCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "collaboratorCell"

    weak var delegate: CollaboratorCollectionViewCellDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        defineSubviewsConstraints()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) { return nil }

    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func addSubviews() {

    }

    func defineSubviewsConstraints() {

    }
}

extension CollaboratorCollectionViewCell {
    struct Configuration {
        let imageUrl: String
        let id: String
    }

    func build() {
        self.backgroundColor = .green
    }
}
