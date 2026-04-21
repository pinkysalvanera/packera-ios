import Foundation
import Combine

// MARK: - ViewModel

final class TripStyleViewModel: ObservableObject {

    // MARK: - Published state

    @Published private(set) var styles: [TripStyle]
    @Published private(set) var selectedStyle: TripStyle?

    // MARK: - Coordinator callback

    var onNext: ((TripStyle?) -> Void)?

    // MARK: - Init

    init(styles: [TripStyle] = TripStyle.samples) {
        self.styles = styles
    }

    // MARK: - Intents

    func didSelect(_ style: TripStyle) {
        selectedStyle = style
    }

    func didTapNext() {
        onNext?(selectedStyle)
    }
}
