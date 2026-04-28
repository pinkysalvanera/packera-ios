import Foundation

// MARK: - Models

struct WeatherSummary {
    let destination: Destination
    let tripType: String
    let temperature: TemperatureInfo
    let conditions: WeatherConditions
    let expectations: [WeatherExpectation]
    let localEvents: [LocalEvent]
}

struct TemperatureInfo {
    let feelsLikeRange: String
    let actualRange: String
    let recommendation: String
}

struct WeatherConditions {
    let rain: WeatherCondition
    let wind: WeatherCondition
}

struct WeatherCondition {
    let type: String // "rain", "wind", etc.
    let description: String
    let iconName: String
}

struct WeatherExpectation {
    let title: String
    let iconName: String
}

struct LocalEvent {
    let date: String
    let name: String
    let description: String
    let impact: String
}

// MARK: - Sample data

extension WeatherSummary {
    static let sample = WeatherSummary(
        destination: Destination.samples[0], // Tokyo
        tripType: "Urban / cultural trip",
        temperature: TemperatureInfo(
            feelsLikeRange: "6–10°C",
            actualRange: "10–15°C",
            recommendation: "Layers recommended"
        ),
        conditions: WeatherConditions(
            rain: WeatherCondition(
                type: "rain",
                description: "Low chance",
                iconName: "cloud.drizzle.fill"
            ),
            wind: WeatherCondition(
                type: "wind",
                description: "Breezy",
                iconName: "wind"
            )
        ),
        expectations: [
            WeatherExpectation(
                title: "Cool mornings and evenings",
                iconName: "snowflake"
            ),
            WeatherExpectation(
                title: "Indoor spaces may feel warmer",
                iconName: "building.2.fill"
            ),
            WeatherExpectation(
                title: "Mostly city walking weather",
                iconName: "figure.walk"
            ),
            WeatherExpectation(
                title: "Sunset around 5:30 PM",
                iconName: "sunset.fill"
            )
        ],
        localEvents: [
            LocalEvent(
                date: "Feb 23",
                name: "Emperor's Birthday",
                description: "Local holiday",
                impact: "Expect bigger crowds. Some businesses may have adjusted hours"
            )
        ]
    )
}