import Foundation

// MARK: - Model

struct PackingPreference: Identifiable {
    let id: String
    let name: String
    let description: String
    let imageName: String  // asset name – to be added later
}

// MARK: - Sample data

extension PackingPreference {
    static let samples: [PackingPreference] = [
        PackingPreference(
            id: "minimalist",
            name: "Minimalist",
            description: "Pack light, only the essentials",
            imageName: "pref_minimalist"
        ),
        PackingPreference(
            id: "runs_cold",
            name: "Runs Cold",
            description: "Prone to feeling chilly",
            imageName: "pref_runs_cold"
        ),
        PackingPreference(
            id: "runs_warm",
            name: "Runs Warm",
            description: "Easily overheats",
            imageName: "pref_runs_warm"
        ),
        PackingPreference(
            id: "laundry_access",
            name: "Has Laundry Access",
            description: "Wash during your trip",
            imageName: "pref_laundry"
        )
    ]
}
