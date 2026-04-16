import SwiftUI

// MARK: - Coordinator

/// Owns navigation for the WhereNext flow.
/// Conforms to ObservableObject so it can be injected as an environment object
/// or held by a parent coordinator.
final class WhereNextCoordinator: ObservableObject {

    // MARK: - Navigation state

    @Published var isFinished: Bool = false

    // MARK: - Factory

    /// Builds the fully wired-up entry view for this module.
    func makeWhereNextView() -> some View {
        let viewModel = WhereNextViewModel()
        viewModel.onNext = { [weak self] in
            self?.handleFlowFinished()
        }
        return WhereNextView(viewModel: viewModel)
    }

    // MARK: - Navigation handlers

    private func handleFlowFinished() {
        // Signal to the parent coordinator that the WhereNext flow is complete.
        // Replace with a push / sheet / custom transition as needed.
        isFinished = true
    }
}
