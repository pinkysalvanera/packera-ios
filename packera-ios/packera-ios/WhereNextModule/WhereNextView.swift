import SwiftUI

// MARK: - View

struct WhereNextView: View {

    @ObservedObject var viewModel: WhereNextViewModel

    // MARK: - Body

    var body: some View {
        ZStack {
            backgroundLayer

            VStack(spacing: 0) {
                headerSection
                    .padding(.top, 60)

                Spacer()

                destinationCard(for: viewModel.currentDestination)
                    .padding(.horizontal, 24)

                Spacer()

                pageIndicator
                    .padding(.bottom, 20)

                nextButton
                    .padding(.horizontal, 24)
                    .padding(.bottom, 40)
            }
        }
        .ignoresSafeArea()
    }

    // MARK: - Background

    private var backgroundLayer: some View {
        ZStack {
            // TODO: Replace Color with Image(viewModel.currentDestination.backgroundImageName)
            //       once assets are added.
            Color(red: 0.82, green: 0.87, blue: 0.93)
                .ignoresSafeArea()

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
        }
    }

    // MARK: - Header

    private var headerSection: some View {
        VStack(spacing: 6) {
            Text("Built for your trip")
                .font(.system(size: 15, weight: .regular))
                .foregroundColor(Color(red: 0.25, green: 0.30, blue: 0.40).opacity(0.8))

            Text("Where next?")
                .font(.system(size: 36, weight: .bold, design: .serif))
                .foregroundColor(Color(red: 0.15, green: 0.20, blue: 0.32))
        }
    }

    // MARK: - Destination Card

    private func destinationCard(for destination: Destination) -> some View {
        VStack(alignment: .leading, spacing: 12) {

            Text("\(destination.city), \(destination.country)")
                .font(.system(size: 26, weight: .bold, design: .serif))
                .foregroundColor(Color(red: 0.15, green: 0.20, blue: 0.32))
                .padding(.horizontal, 20)
                .padding(.top, 20)

            infoPillsRow(for: destination)
                .padding(.horizontal, 20)

            Text(destination.description)
                .font(.system(size: 15, weight: .regular))
                .foregroundColor(Color(red: 0.35, green: 0.40, blue: 0.50))
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 20)

            destinationImagePlaceholder(imageName: destination.destinationImageName)
                .frame(height: 200)
                .clipped()
        }
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.08), radius: 16, x: 0, y: 4)
    }

    // MARK: - Info Pills

    private func infoPillsRow(for destination: Destination) -> some View {
        HStack(spacing: 0) {
            Text(destination.dateRange)
                .font(.system(size: 13, weight: .regular))
                .foregroundColor(Color(red: 0.25, green: 0.30, blue: 0.40))

            pillDivider

            HStack(spacing: 4) {
                Image(systemName: destination.weatherIcon)
                    .font(.system(size: 13))
                    .foregroundColor(.orange.opacity(0.8))
                Text(destination.weatherCondition)
                    .font(.system(size: 13, weight: .regular))
                    .foregroundColor(Color(red: 0.25, green: 0.30, blue: 0.40))
            }

            pillDivider

            HStack(spacing: 4) {
                Image(systemName: "sun.min.fill")
                    .font(.system(size: 13))
                    .foregroundColor(.yellow)
                Text(destination.tempRange)
                    .font(.system(size: 13, weight: .regular))
                    .foregroundColor(Color(red: 0.25, green: 0.30, blue: 0.40))
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 14)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(red: 0.88, green: 0.88, blue: 0.90), lineWidth: 1)
        )
    }

    private var pillDivider: some View {
        Rectangle()
            .fill(Color(red: 0.88, green: 0.88, blue: 0.90))
            .frame(width: 1, height: 16)
            .padding(.horizontal, 10)
    }

    // MARK: - Destination Image

    private func destinationImagePlaceholder(imageName: String) -> some View {
        // TODO: Replace with Image(imageName).resizable().scaledToFill()
        //       once assets are added.
        ZStack {
            Color(red: 0.93, green: 0.91, blue: 0.88)
            Image(systemName: "photo")
                .font(.system(size: 40))
                .foregroundColor(Color(red: 0.70, green: 0.68, blue: 0.65))
        }
    }

    // MARK: - Page Indicator

    private var pageIndicator: some View {
        HStack(spacing: 8) {
            ForEach(0..<viewModel.totalCount, id: \.self) { index in
                Circle()
                    .fill(index == viewModel.currentIndex
                          ? Color(red: 0.20, green: 0.25, blue: 0.40)
                          : Color(red: 0.75, green: 0.75, blue: 0.78))
                    .frame(width: index == viewModel.currentIndex ? 10 : 8,
                           height: index == viewModel.currentIndex ? 10 : 8)
                    .animation(.easeInOut(duration: 0.2), value: viewModel.currentIndex)
            }
        }
    }

    // MARK: - Next Button

    private var nextButton: some View {
        Button {
            withAnimation(.easeInOut) {
                viewModel.didTapNext()
            }
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
}

// MARK: - Preview

#Preview {
    WhereNextCoordinator().makeWhereNextView()
}
