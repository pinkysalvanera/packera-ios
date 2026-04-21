import Foundation

// MARK: - Model

struct TripStyle: Identifiable {
    let id: String
    let name: String
    let description: String
    let imageName: String  // asset name – to be added later
}

// MARK: - Sample data

extension TripStyle {
    static let samples: [TripStyle] = [
        TripStyle(
            id: "business",
            name: "Business",
            description: "Polished, efficient, meeting-ready",
            imageName: "trip_style_business"
        ),
        TripStyle(
            id: "leisure",
            name: "Leisure",
            description: "Comfortable, relaxed, easy outfits",
            imageName: "trip_style_leisure"
        ),
        TripStyle(
            id: "blended",
            name: "Blended",
            description: "Versatile pieces for work and downtime",
            imageName: "trip_style_blended"
        )
    ]
}
