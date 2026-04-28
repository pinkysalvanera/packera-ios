import SwiftUI

// MARK: - Coordinator

/// Owns navigation for the PackingList flow.
final class PackingListCoordinator: ObservableObject {

    // MARK: - Navigation state

    @Published var shouldGoBack: Bool = false
    @Published var shouldShowReviewCustomize: Bool = false
    @Published var shouldShowWhyThisSize: Bool = false

    // MARK: - Factory

    /// Builds the fully wired-up entry view for this module.
    func makePackingListView() -> some View {
        let viewModel = PackingListViewModel()
        
        viewModel.onBack = { [weak self] in
            self?.handleBack()
        }
        
        viewModel.onReviewCustomize = { [weak self] in
            self?.handleReviewCustomize()
        }
        
        viewModel.onWhyThisSize = { [weak self] in
            self?.handleWhyThisSize()
        }
        
        return PackingListView(viewModel: viewModel)
    }

    // MARK: - Navigation handlers

    private func handleBack() {
        shouldGoBack = true
    }

    private func handleReviewCustomize() {
        shouldShowReviewCustomize = true
    }

    private func handleWhyThisSize() {
        shouldShowWhyThisSize = true
    }
}