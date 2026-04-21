import SwiftUI

// MARK: - Coordinator

/// Owns navigation for the PackingPreferences flow.
final class PackingPreferencesCoordinator: ObservableObject {

    // MARK: - Navigation state

    @Published var isFinished: Bool = false
    @Published var selectedPreferenceIDs: Set<String> = []

    // MARK: - Factory

    /// Builds the fully wired-up entry view for this module.
    func makePackingPreferencesView() -> some View {
        let viewModel = PackingPreferencesViewModel()
        viewModel.onNext = { [weak self] selectedIDs in
            self?.handleNext(selectedIDs: selectedIDs)
        }
        return PackingPreferencesView(viewModel: viewModel)
    }

    // MARK: - Navigation handlers

    private func handleNext(selectedIDs: Set<String>) {
        selectedPreferenceIDs = selectedIDs
        isFinished = true
    }
}
