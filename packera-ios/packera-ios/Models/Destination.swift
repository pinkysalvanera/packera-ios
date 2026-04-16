import Foundation

// MARK: - Model

struct Destination {
    let city: String
    let country: String
    let dateRange: String
    let weatherCondition: String
    let weatherIcon: String          // SF Symbol name
    let tempRange: String
    let description: String
    let backgroundImageName: String  // asset name – to be added later
    let destinationImageName: String // asset name – to be added later
}

// MARK: - Sample data

extension Destination {
    static let samples: [Destination] = [
        Destination(
            city: "Tokyo",
            country: "Japan",
            dateRange: "Feb 22 – Mar 1",
            weatherCondition: "Cool & Mild",
            weatherIcon: "cloud.sun.fill",
            tempRange: "48–58°F",
            description: "A personalized packing list for Tokyo in late February.",
            backgroundImageName: "bg_tokyo_sky",
            destinationImageName: "dest_tokyo"
        ),
        Destination(
            city: "Paris",
            country: "France",
            dateRange: "Mar 5 – Mar 12",
            weatherCondition: "Cloudy",
            weatherIcon: "cloud.fill",
            tempRange: "45–55°F",
            description: "A personalized packing list for Paris in early March.",
            backgroundImageName: "bg_paris_sky",
            destinationImageName: "dest_paris"
        ),
        Destination(
            city: "Bali",
            country: "Indonesia",
            dateRange: "Apr 1 – Apr 8",
            weatherCondition: "Warm & Sunny",
            weatherIcon: "sun.max.fill",
            tempRange: "78–88°F",
            description: "A personalized packing list for Bali in early April.",
            backgroundImageName: "bg_bali_sky",
            destinationImageName: "dest_bali"
        ),
        Destination(
            city: "New York",
            country: "USA",
            dateRange: "May 10 – May 17",
            weatherCondition: "Mild",
            weatherIcon: "cloud.sun.fill",
            tempRange: "60–72°F",
            description: "A personalized packing list for New York in mid May.",
            backgroundImageName: "bg_nyc_sky",
            destinationImageName: "dest_nyc"
        ),
        Destination(
            city: "Sydney",
            country: "Australia",
            dateRange: "Jun 3 – Jun 10",
            weatherCondition: "Cool",
            weatherIcon: "wind",
            tempRange: "55–65°F",
            description: "A personalized packing list for Sydney in early June.",
            backgroundImageName: "bg_sydney_sky",
            destinationImageName: "dest_sydney"
        )
    ]
}
