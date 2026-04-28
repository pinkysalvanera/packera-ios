import Foundation
import Combine

// MARK: - ViewModel

final class WeatherSummaryViewModel: ObservableObject {

    // MARK: - Published state

    @Published private(set) var weatherData: WeatherSummary

    // MARK: - Coordinator callback

    var onNext: (() -> Void)?

    // MARK: - Computed helpers

    var currentPageIndex: Int {
        return 3 // 4th screen in the flow (0-indexed)
    }

    // MARK: - Init

    init(weatherData: WeatherSummary = WeatherSummary.sample) {
        self.weatherData = weatherData
    }

    // MARK: - Intents

    func didTapNext() {
        onNext?()
    }
}