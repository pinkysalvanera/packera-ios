import SwiftUI

// MARK: - Coordinator

/// Owns navigation for the TripStyle flow.
final class TripStyleCoordinator: ObservableObject {

    // MARK: - Navigation state

    @Published var isFinished: Bool = false
    @Published var selectedStyle: TripStyle?

    // MARK: - Factory

    /// Builds the fully wired-up entry view for this module.
    func makeTripStyleView() -> some View {
        let viewModel = TripStyleViewModel()
        viewModel.onNext = { [weak self] style in
            self?.handleNext(style: style)
        }
        return TripStyleView(viewModel: viewModel)
    }

    // MARK: - Navigation handlers

    private func handleNext(style: TripStyle?) {
        selectedStyle = style
        isFinished = true
    }
}
