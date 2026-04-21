import SwiftUI

// MARK: - View

struct TripStyleView: View {

    @ObservedObject var viewModel: TripStyleViewModel

    // MARK: - Body

    var body: some View {
        ZStack {
            backgroundLayer

            VStack(spacing: 0) {
                headerSection
                    .padding(.top, 60)

                Spacer()

                styleOptions
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
            // TODO: Replace with actual background image asset
            Color(red: 0.93, green: 0.91, blue: 0.88)
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
        Text("Trip style")
            .font(.system(size: 36, weight: .bold, design: .serif))
            .foregroundColor(Color(red: 0.15, green: 0.20, blue: 0.32))
    }

    // MARK: - Style Options

    private var styleOptions: some View {
        VStack(spacing: 16) {
            ForEach(viewModel.styles) { style in
                styleCard(for: style)
                    .onTapGesture {
                        viewModel.didSelect(style)
                    }
            }
        }
    }

    private func styleCard(for style: TripStyle) -> some View {
        let isSelected = viewModel.selectedStyle?.id == style.id

        return HStack(spacing: 0) {
            // Image placeholder
            ZStack {
                Color(red: 0.93, green: 0.91, blue: 0.88)
                // TODO: Replace with Image(style.imageName).resizable().scaledToFill()
                Image(systemName: "photo")
                    .font(.system(size: 24))
                    .foregroundColor(Color(red: 0.70, green: 0.68, blue: 0.65))
            }
            .frame(width: 100, height: 90)
            .clipped()

            // Text content
            VStack(alignment: .leading, spacing: 4) {
                Text(style.name)
                    .font(.system(size: 20, weight: .bold, design: .serif))
                    .foregroundColor(Color(red: 0.15, green: 0.20, blue: 0.32))

                Rectangle()
                    .fill(Color(red: 0.88, green: 0.86, blue: 0.83))
                    .frame(height: 1)

                Text(style.description)
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(Color(red: 0.35, green: 0.40, blue: 0.50))
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 14)

            Spacer()

            // Checkmark
            if isSelected {
                Image(systemName: "checkmark.circle.fill")
                    .font(.system(size: 24))
                    .foregroundColor(Color(red: 0.55, green: 0.58, blue: 0.75))
                    .padding(.trailing, 16)
            }
        }
        .background(Color.white)
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(
                    isSelected
                        ? Color(red: 0.55, green: 0.58, blue: 0.75)
                        : Color.clear,
                    lineWidth: 1.5
                )
        )
        .shadow(color: .black.opacity(0.06), radius: 8, x: 0, y: 2)
        .animation(.easeInOut(duration: 0.15), value: isSelected)
    }

    // MARK: - Page Indicator

    private var pageIndicator: some View {
        HStack(spacing: 8) {
            ForEach(0..<5, id: \.self) { index in
                Circle()
                    .fill(index == 1
                          ? Color(red: 0.20, green: 0.25, blue: 0.40)
                          : Color(red: 0.75, green: 0.75, blue: 0.78))
                    .frame(width: index == 1 ? 10 : 8,
                           height: index == 1 ? 10 : 8)
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
}

// MARK: - Preview

#Preview {
    TripStyleCoordinator().makeTripStyleView()
}
