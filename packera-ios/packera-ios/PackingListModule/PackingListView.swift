import SwiftUI

// MARK: - View

struct PackingListView: View {

    @ObservedObject var viewModel: PackingListViewModel

    // MARK: - Body

    var body: some View {
        ZStack {
            backgroundLayer

            VStack(spacing: 0) {
                headerSection
                    .padding(.top, 60)

                ScrollView {
                    VStack(spacing: 16) {
                        luggageRecommendationCard
                            .padding(.horizontal, 20)

                        categoryList
                            .padding(.horizontal, 20)

                        tipSection
                            .padding(.horizontal, 20)
                            .padding(.top, 8)

                        Spacer(minLength: 100) // Space for bottom button
                    }
                    .padding(.top, 20)
                }

                reviewButton
                    .padding(.horizontal, 20)
                    .padding(.bottom, 40)
            }
        }
        .ignoresSafeArea()
    }

    // MARK: - Background

    private var backgroundLayer: some View {
        ZStack {
            // TODO: Replace with cherry blossom + Tokyo skyline background image
            LinearGradient(
                colors: [
                    Color(red: 0.95, green: 0.93, blue: 0.90),
                    Color(red: 0.90, green: 0.88, blue: 0.85)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            // Cherry blossom decorative elements (placeholder)
            VStack {
                HStack {
                    Image(systemName: "leaf.fill")
                        .font(.system(size: 20))
                        .foregroundColor(.pink.opacity(0.3))
                        .padding(.leading, 30)
                        .padding(.top, 100)
                    Spacer()
                }
                Spacer()
                HStack {
                    Spacer()
                    Image(systemName: "leaf.fill")
                        .font(.system(size: 16))
                        .foregroundColor(.pink.opacity(0.2))
                        .padding(.trailing, 40)
                        .padding(.bottom, 200)
                }
            }
        }
    }

    // MARK: - Header

    private var headerSection: some View {
        VStack(spacing: 8) {
            HStack {
                Button {
                    viewModel.didTapBack()
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(Color(red: 0.20, green: 0.25, blue: 0.40))
                }
                .padding(.leading, 20)

                Spacer()
            }

            Text("Your Packing List")
                .font(.system(size: 28, weight: .bold, design: .serif))
                .foregroundColor(Color(red: 0.15, green: 0.20, blue: 0.32))

            VStack(spacing: 2) {
                Text("\(viewModel.packingData.destination.city), \(viewModel.packingData.destination.country) • \(viewModel.packingData.destination.dateRange)")
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(Color(red: 0.25, green: 0.30, blue: 0.40))

                Text("Late winter • 6–10°C feels like")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(Color(red: 0.35, green: 0.40, blue: 0.50))
            }
        }
    }

    // MARK: - Luggage Recommendation

    private var luggageRecommendationCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("RECOMMENDED")
                    .font(.system(size: 11, weight: .bold))
                    .foregroundColor(Color(red: 0.45, green: 0.50, blue: 0.65))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color(red: 0.90, green: 0.92, blue: 0.96))
                    .cornerRadius(4)

                Spacer()
            }

            HStack(spacing: 16) {
                // Luggage image placeholder
                ZStack {
                    Color(red: 0.93, green: 0.91, blue: 0.88)
                    // TODO: Replace with Image(viewModel.packingData.luggageRecommendation.imageName)
                    Image(systemName: "suitcase.fill")
                        .font(.system(size: 32))
                        .foregroundColor(Color(red: 0.60, green: 0.58, blue: 0.55))
                }
                .frame(width: 80, height: 80)
                .cornerRadius(12)

                VStack(alignment: .leading, spacing: 4) {
                    Text(viewModel.packingData.luggageRecommendation.type)
                        .font(.system(size: 20, weight: .bold, design: .serif))
                        .foregroundColor(Color(red: 0.15, green: 0.20, blue: 0.32))

                    Text(viewModel.packingData.luggageRecommendation.reason)
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(Color(red: 0.35, green: 0.40, blue: 0.50))
                }

                Spacer()

                Button {
                    viewModel.didTapWhyThisSize()
                } label: {
                    HStack(spacing: 4) {
                        Text("Why this size?")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(Color(red: 0.25, green: 0.30, blue: 0.40))
                        Image(systemName: "chevron.right")
                            .font(.system(size: 12))
                            .foregroundColor(Color(red: 0.25, green: 0.30, blue: 0.40))
                    }
                }
            }
        }
        .padding(16)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.06), radius: 8, x: 0, y: 2)
    }

    // MARK: - Category List

    private var categoryList: some View {
        VStack(spacing: 12) {
            ForEach(viewModel.packingData.categories) { category in
                categoryCard(for: category)
            }
        }
    }

    private func categoryCard(for category: PackingCategory) -> some View {
        let isExpanded = viewModel.isExpanded(category)

        return VStack(spacing: 0) {
            // Header
            Button {
                withAnimation(.easeInOut(duration: 0.2)) {
                    viewModel.didTapCategory(category)
                }
            } label: {
                HStack(spacing: 16) {
                    // Category image placeholder
                    ZStack {
                        Color(red: 0.93, green: 0.91, blue: 0.88)
                        // TODO: Replace with Image(category.imageName)
                        Image(systemName: "tshirt.fill")
                            .font(.system(size: 24))
                            .foregroundColor(Color(red: 0.60, green: 0.58, blue: 0.55))
                    }
                    .frame(width: 60, height: 60)
                    .cornerRadius(12)

                    VStack(alignment: .leading, spacing: 4) {
                        Text(category.name)
                            .font(.system(size: 18, weight: .bold, design: .serif))
                            .foregroundColor(Color(red: 0.15, green: 0.20, blue: 0.32))

                        Text("\(category.itemCount) items • \(category.description)")
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(Color(red: 0.35, green: 0.40, blue: 0.50))
                    }

                    Spacer()

                    Image(systemName: "chevron.down")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(Color(red: 0.55, green: 0.58, blue: 0.75))
                        .rotationEffect(.degrees(isExpanded ? 180 : 0))
                        .animation(.easeInOut(duration: 0.2), value: isExpanded)
                }
                .padding(16)
            }
            .buttonStyle(PlainButtonStyle())

            // Expanded content
            if isExpanded {
                VStack(spacing: 8) {
                    Rectangle()
                        .fill(Color(red: 0.92, green: 0.90, blue: 0.87))
                        .frame(height: 1)
                        .padding(.horizontal, 16)

                    VStack(spacing: 12) {
                        ForEach(category.items) { item in
                            itemRow(for: item)
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 16)
                }
            }
        }
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.06), radius: 8, x: 0, y: 2)
    }

    private func itemRow(for item: PackingItem) -> some View {
        HStack(spacing: 12) {
            // Item image placeholder
            ZStack {
                Color(red: 0.95, green: 0.93, blue: 0.90)
                // TODO: Replace with Image(item.imageName ?? "default_item")
                Image(systemName: "square.fill")
                    .font(.system(size: 16))
                    .foregroundColor(Color(red: 0.70, green: 0.68, blue: 0.65))
            }
            .frame(width: 40, height: 40)
            .cornerRadius(8)

            VStack(alignment: .leading, spacing: 2) {
                Text(item.name)
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(Color(red: 0.15, green: 0.20, blue: 0.32))

                if let description = item.description {
                    Text(description)
                        .font(.system(size: 13, weight: .regular))
                        .foregroundColor(Color(red: 0.45, green: 0.50, blue: 0.60))
                }
            }

            Spacer()

            if item.isRecommended {
                Text("✓")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(Color(red: 0.30, green: 0.70, blue: 0.40))
            }
        }
    }

    // MARK: - Tip Section

    private var tipSection: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: "lightbulb.fill")
                .font(.system(size: 16))
                .foregroundColor(.yellow.opacity(0.8))
                .padding(.top, 2)

            VStack(alignment: .leading, spacing: 4) {
                Text("Tip:")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Color(red: 0.25, green: 0.30, blue: 0.40))

                Text(viewModel.packingData.tip)
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(Color(red: 0.35, green: 0.40, blue: 0.50))
            }

            Spacer()
        }
        .padding(16)
        .background(Color.white.opacity(0.8))
        .cornerRadius(12)
    }

    // MARK: - Review Button

    private var reviewButton: some View {
        Button {
            viewModel.didTapReviewCustomize()
        } label: {
            HStack {
                Text("Review & Customize")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(.white)

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.white)
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 18)
            .background(Color(red: 0.25, green: 0.30, blue: 0.45))
            .cornerRadius(16)
        }
    }
}

// MARK: - Preview

#Preview {
    PackingListCoordinator().makePackingListView()
}