import Foundation
import Combine

// MARK: - ViewModel

final class PackingListViewModel: ObservableObject {

    // MARK: - Published state

    @Published private(set) var packingData: PackingListData
    @Published private(set) var expandedCategories: Set<String> = []

    // MARK: - Coordinator callbacks

    var onBack: (() -> Void)?
    var onReviewCustomize: (() -> Void)?
    var onWhyThisSize: (() -> Void)?

    // MARK: - Computed helpers

    func isExpanded(_ category: PackingCategory) -> Bool {
        expandedCategories.contains(category.id)
    }

    // MARK: - Init

    init(packingData: PackingListData = PackingListData.sample) {
        self.packingData = packingData
    }

    // MARK: - Intents

    func didTapBack() {
        onBack?()
    }

    func didTapCategory(_ category: PackingCategory) {
        if expandedCategories.contains(category.id) {
            expandedCategories.remove(category.id)
        } else {
            expandedCategories.insert(category.id)
        }
    }

    func didTapWhyThisSize() {
        onWhyThisSize?()
    }

    func didTapReviewCustomize() {
        onReviewCustomize?()
    }
}