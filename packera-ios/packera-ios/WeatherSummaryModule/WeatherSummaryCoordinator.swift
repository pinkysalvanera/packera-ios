import SwiftUI

// MARK: - Coordinator

/// Owns navigation for the WeatherSummary flow.
final class WeatherSummaryCoordinator: ObservableObject {

    // MARK: - Navigation state

    @Published var isFinished: Bool = false

    // MARK: - Factory

    /// Builds the fully wired-up entry view for this module.
    func makeWeatherSummaryView() -> some View {
        let viewModel = WeatherSummaryViewModel()
        viewModel.onNext = { [weak self] in
            self?.handleNext()
        }
        return WeatherSummaryView(viewModel: viewModel)
    }

    // MARK: - Navigation handlers

    private func handleNext() {
        isFinished = true
    }
}