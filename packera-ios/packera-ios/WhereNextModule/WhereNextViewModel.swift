import Foundation
import Combine

// MARK: - ViewModel

final class WhereNextViewModel: ObservableObject {

    // MARK: - Published state

    @Published private(set) var destinations: [Destination]
    @Published private(set) var currentIndex: Int = 0

    // MARK: - Coordinator callback

    var onNext: (() -> Void)?

    // MARK: - Computed helpers

    var currentDestination: Destination {
        destinations[currentIndex]
    }

    var totalCount: Int {
        destinations.count
    }

    var isLastDestination: Bool {
        currentIndex == destinations.count - 1
    }

    // MARK: - Init

    init(destinations: [Destination] = Destination.samples) {
        self.destinations = destinations
    }

    // MARK: - Intents

    func didTapNext() {
        if isLastDestination {
            onNext?()
        } else {
            currentIndex += 1
        }
    }
}
