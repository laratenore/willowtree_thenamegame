import Foundation
import UIKit

public enum WillowColors: CaseIterable {
    case darkBlue
    case green
    case red

    var color: UIColor {
        switch self {
        case .darkBlue:
            return UIColor(red: 0.082, green: 0.396, blue: 0.615, alpha: 1.0)
        case .green:
            return UIColor(red: 0.203, green: 0.780, blue: 0.349, alpha: 0.6)
        case .red:
            return UIColor(red: 1.0, green: 0.231, blue: 0.188, alpha: 0.6)
        }
    }
}
