import Foundation
import UIKit

protocol GameViewDelegate: AnyObject {
    
}

protocol GameViewInterface: AnyObject {
    var delegate: GameViewDelegate? { get set }
    
    func build()
}

class GameView: UIView, GameViewInterface {
    private var configuration: Configuration?
    weak var delegate: GameViewDelegate?
    
    private let collectionViewLayout: UICollectionViewCompositionalLayout = {
        return UICollectionViewCompositionalLayout { _,_ in
            let productItem = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0 / CGFloat(Constants.numberOfCellsPerRow)),
                    heightDimension: .estimated(Constants.estimatedCellHeight)
                )
            )
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .estimated(Constants.estimatedCellHeight)
                ),
                subitems: [productItem])
            
            group.interItemSpacing = NSCollectionLayoutSpacing.fixed(Constants.itemSpacing)
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = 24
            section.contentInsets = NSDirectionalEdgeInsets(
                top: 0,
                leading: 16,
                bottom: 16,
                trailing: 16
            )
            return section
        }
    }()

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CollaboratorCollectionViewCell.self, forCellWithReuseIdentifier: CollaboratorCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        backgroundColor = .white
        
        addSubviews()
        defineSubviewsConstraints()
    }
    
    private func addSubviews() {
        addSubview(collectionView)
    }
    
    private func defineSubviewsConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension GameView {
    struct Configuration {
        let collaboratorsConfiguration: Collaborators
        let selectedIndex: Int
    }

    func build() {
        //self.configuration = configuration
        collectionView.reloadData()
    }
}

extension GameView {
    private enum Constants {
        static let estimatedCellHeight: CGFloat = 164
        static let numberOfCellsPerRow = 2
        static let itemSpacing: CGFloat = 16
    }
}


extension GameView: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CollaboratorCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: CollaboratorCollectionViewCell.identifier, for: indexPath) as! CollaboratorCollectionViewCell
        cell.build()
        return cell
    }
}

extension GameView: CollaboratorCollectionViewCellDelegate {
    
}
