import Foundation
import UIKit

protocol HomePageViewDelegate: AnyObject {
    func gameSelected()
}

protocol HomePageViewInterface: AnyObject {
    var delegate: HomePageViewDelegate? { get set }
}

class HomePageView: UIView, HomePageViewInterface {
    weak var delegate: HomePageViewDelegate?
    
    private lazy var practiceButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = WillowColors.darkBlue.color
        button.tintColor = .white
        button.layer.cornerRadius = 15
        button.layer.borderColor = WillowColors.darkBlue.color.cgColor
        button.layer.borderWidth = 5
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 17)
        ]
        let titleAttributedString = NSAttributedString(string: "Practice Mode", attributes: titleAttributes)
        button.setAttributedTitle(titleAttributedString, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(practiceButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func practiceButtonTapped(_ sender: UIButton) {
        delegate?.gameSelected()
    }
    
    private func configureView() {
        backgroundColor = .white
        
        addSubviews()
        defineSubviewsConstraints()
    }
    
    private func addSubviews() {
        addSubview(practiceButton)
    }
    
    private func defineSubviewsConstraints() {
        NSLayoutConstraint.activate([
            practiceButton.topAnchor.constraint(greaterThanOrEqualTo: self.safeAreaLayoutGuide.topAnchor),
            practiceButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            practiceButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            practiceButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -54),
            practiceButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
}

