import SwiftUI

// MARK: - View

struct WeatherSummaryView: View {

    @ObservedObject var viewModel: WeatherSummaryViewModel

    // MARK: - Body

    var body: some View {
        ZStack {
            backgroundLayer

            VStack(spacing: 0) {
                headerSection
                    .padding(.top, 60)

                ScrollView {
                    VStack(spacing: 16) {
                        weatherCard
                            .padding(.horizontal, 20)

                        HStack(spacing: 12) {
                            whatToExpectCard
                            duringYourDatesCard
                        }
                        .padding(.horizontal, 20)

                        Spacer(minLength: 60) // Space for bottom elements
                    }
                    .padding(.top, 30)
                }

                pageIndicator
                    .padding(.bottom, 20)

                nextButton
                    .padding(.horizontal, 20)
                    .padding(.bottom, 40)
            }
        }
        .ignoresSafeArea()
    }

    // MARK: - Background

    private var backgroundLayer: some View {
        ZStack {
            // TODO: Replace with Tokyo skyline background image
            LinearGradient(
                colors: [
                    Color(red: 0.85, green: 0.88, blue: 0.92),
                    Color(red: 0.78, green: 0.82, blue: 0.88)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            // Airplane in top right
            VStack {
                HStack {
                    Spacer()
                    Image(systemName: "airplane")
                        .font(.system(size: 28))
                        .foregroundColor(.white.opacity(0.8))
                        .rotationEffect(.degrees(45))
                        .padding(.top, 80)
                        .padding(.trailing, 32)
                }
                Spacer()
            }

            // Tokyo Tower silhouette (placeholder)
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Image(systemName: "building.2.fill")
                        .font(.system(size: 40))
                        .foregroundColor(.white.opacity(0.2))
                        .padding(.trailing, 60)
                        .padding(.bottom, 300)
                }
            }
        }
    }

    // MARK: - Header

    private var headerSection: some View {
        VStack(spacing: 8) {
            Text("\(viewModel.weatherData.destination.city), \(viewModel.weatherData.destination.country)")
                .font(.system(size: 32, weight: .bold, design: .serif))
                .foregroundColor(Color(red: 0.15, green: 0.20, blue: 0.32))

            Text(viewModel.weatherData.destination.dateRange)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(Color(red: 0.25, green: 0.30, blue: 0.40))

            Text("Late winter • \(viewModel.weatherData.tripType)")
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(Color(red: 0.35, green: 0.40, blue: 0.50))
        }
    }

    // MARK: - Weather Card

    private var weatherCard: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(spacing: 12) {
                Image(systemName: "cloud.sun.fill")
                    .font(.system(size: 24))
                    .foregroundColor(.orange.opacity(0.8))

                Text("Weather")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(Color(red: 0.15, green: 0.20, blue: 0.32))

                Spacer()
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(viewModel.weatherData.temperature.feelsLikeRange)
                    .font(.system(size: 36, weight: .bold))
                    .foregroundColor(Color(red: 0.15, green: 0.20, blue: 0.32))

                Text("Actual range \(viewModel.weatherData.temperature.actualRange)")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(Color(red: 0.35, green: 0.40, blue: 0.50))
            }

            HStack(spacing: 24) {
                HStack(spacing: 6) {
                    Image(systemName: viewModel.weatherData.conditions.rain.iconName)
                        .font(.system(size: 16))
                        .foregroundColor(.blue.opacity(0.7))

                    Text("Rain: \(viewModel.weatherData.conditions.rain.description)")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(Color(red: 0.35, green: 0.40, blue: 0.50))
                }

                HStack(spacing: 6) {
                    Image(systemName: viewModel.weatherData.conditions.wind.iconName)
                        .font(.system(size: 16))
                        .foregroundColor(.gray.opacity(0.7))

                    Text("Wind: \(viewModel.weatherData.conditions.wind.description)")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(Color(red: 0.35, green: 0.40, blue: 0.50))
                }
            }

            Text(viewModel.weatherData.temperature.recommendation)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(Color(red: 0.25, green: 0.30, blue: 0.40))
                .padding(.top, 4)
        }
        .padding(20)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.06), radius: 8, x: 0, y: 2)
    }

    // MARK: - What to Expect Card

    private var whatToExpectCard: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("What to expect")
                .font(.system(size: 18, weight: .semibold, design: .serif))
                .foregroundColor(Color(red: 0.15, green: 0.20, blue: 0.32))

            VStack(alignment: .leading, spacing: 12) {
                ForEach(Array(viewModel.weatherData.expectations.enumerated()), id: \.offset) { index, expectation in
                    HStack(alignment: .top, spacing: 8) {
                        Image(systemName: expectation.iconName)
                            .font(.system(size: 16))
                            .foregroundColor(iconColor(for: index))
                            .frame(width: 20)

                        Text(expectation.title)
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(Color(red: 0.35, green: 0.40, blue: 0.50))
                            .fixedSize(horizontal: false, vertical: true)

                        Spacer()
                    }
                }
            }
        }
        .padding(16)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.06), radius: 8, x: 0, y: 2)
    }

    // MARK: - During Your Dates Card

    private var duringYourDatesCard: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("During your dates")
                .font(.system(size: 18, weight: .semibold, design: .serif))
                .foregroundColor(Color(red: 0.15, green: 0.20, blue: 0.32))

            if let event = viewModel.weatherData.localEvents.first {
                VStack(alignment: .leading, spacing: 8) {
                    HStack(spacing: 8) {
                        Image(systemName: "calendar")
                            .font(.system(size: 14))
                            .foregroundColor(Color(red: 0.45, green: 0.50, blue: 0.65))

                        Text("23")
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(Color(red: 0.45, green: 0.50, blue: 0.65))
                            .padding(.horizontal, 6)
                            .padding(.vertical, 2)
                            .background(Color(red: 0.90, green: 0.92, blue: 0.96))
                            .cornerRadius(4)

                        Text("Local holiday")
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(Color(red: 0.45, green: 0.50, blue: 0.65))

                        Spacer()
                    }

                    Text("\(event.date) – \(event.name)")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(Color(red: 0.25, green: 0.30, blue: 0.40))

                    Text(event.impact)
                        .font(.system(size: 13, weight: .regular))
                        .foregroundColor(Color(red: 0.35, green: 0.40, blue: 0.50))
                        .fixedSize(horizontal: false, vertical: true)

                    // Mini calendar
                    calendarWidget
                        .padding(.top, 8)
                }
            }
        }
        .padding(16)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.06), radius: 8, x: 0, y: 2)
    }

    // MARK: - Calendar Widget

    private var calendarWidget: some View {
        let days = ["S", "M", "T", "W", "Th", "F", "F", "S"]
        
        return VStack(spacing: 4) {
            HStack {
                ForEach(days, id: \.self) { day in
                    Text(day)
                        .font(.system(size: 10, weight: .medium))
                        .foregroundColor(Color(red: 0.45, green: 0.50, blue: 0.65))
                        .frame(width: 20, height: 16)
                }
            }
            
            // Sample week with Feb 23 highlighted
            HStack {
                ForEach(0..<7) { index in
                    let dayNumber = 21 + index
                    let isHighlighted = dayNumber == 23
                    
                    Text("\(dayNumber)")
                        .font(.system(size: 10, weight: isHighlighted ? .bold : .regular))
                        .foregroundColor(isHighlighted ? .white : Color(red: 0.35, green: 0.40, blue: 0.50))
                        .frame(width: 20, height: 20)
                        .background(
                            Circle()
                                .fill(isHighlighted ? Color(red: 0.45, green: 0.50, blue: 0.65) : Color.clear)
                        )
                }
            }
        }
    }

    // MARK: - Page Indicator

    private var pageIndicator: some View {
        HStack(spacing: 8) {
            ForEach(0..<5, id: \.self) { index in
                Circle()
                    .fill(index == viewModel.currentPageIndex
                          ? Color(red: 0.20, green: 0.25, blue: 0.40)
                          : Color(red: 0.75, green: 0.75, blue: 0.78))
                    .frame(width: index == viewModel.currentPageIndex ? 10 : 8,
                           height: index == viewModel.currentPageIndex ? 10 : 8)
            }
        }
    }

    // MARK: - Next Button

    private var nextButton: some View {
        Button {
            viewModel.didTapNext()
        } label: {
            Text("Next")
                .font(.system(size: 17, weight: .semibold))
                .foregroundColor(Color(red: 0.20, green: 0.25, blue: 0.40))
                .frame(maxWidth: .infinity)
                .padding(.vertical, 18)
                .background(Color(red: 0.97, green: 0.94, blue: 0.88))
                .cornerRadius(16)
        }
    }

    // MARK: - Helper

    private func iconColor(for index: Int) -> Color {
        switch index {
        case 0: return .blue.opacity(0.7)
        case 1: return .brown.opacity(0.7)
        case 2: return .gray.opacity(0.7)
        case 3: return .orange.opacity(0.7)
        default: return .gray.opacity(0.7)
        }
    }
}

// MARK: - Preview

#Preview {
    WeatherSummaryCoordinator().makeWeatherSummaryView()
}