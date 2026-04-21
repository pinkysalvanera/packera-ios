import Foundation
import Combine

// MARK: - ViewModel

final class PackingPreferencesViewModel: ObservableObject {

    // MARK: - Published state

    @Published private(set) var preferences: [PackingPreference]
    @Published private(set) var selectedIDs: Set<String> = []

    // MARK: - Coordinator callback

    var onNext: ((Set<String>) -> Void)?

    // MARK: - Computed helpers

    func isSelected(_ preference: PackingPreference) -> Bool {
        selectedIDs.contains(preference.id)
    }

    // MARK: - Init

    init(preferences: [PackingPreference] = PackingPreference.samples) {
        self.preferences = preferences
    }

    // MARK: - Intents

    func didTap(_ preference: PackingPreference) {
        if selectedIDs.contains(preference.id) {
            selectedIDs.remove(preference.id)
        } else {
            selectedIDs.insert(preference.id)
        }
    }

    func didTapNext() {
        onNext?(selectedIDs)
    }
}
