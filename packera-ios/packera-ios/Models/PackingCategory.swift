import Foundation

// MARK: - Models

struct PackingCategory: Identifiable {
    let id: String
    let name: String
    let itemCount: Int
    let description: String
    let imageName: String
    let items: [PackingItem]
}

struct PackingItem: Identifiable {
    let id: String
    let name: String
    let description: String?
    let isRecommended: Bool
    let imageName: String?
}

struct LuggageRecommendation {
    let type: String
    let reason: String
    let imageName: String
}

struct PackingListData {
    let destination: Destination
    let luggageRecommendation: LuggageRecommendation
    let categories: [PackingCategory]
    let tip: String
}

// MARK: - Sample data

extension PackingCategory {
    static let samples: [PackingCategory] = [
        PackingCategory(
            id: "tops",
            name: "Tops",
            itemCount: 8,
            description: "Layers & everyday",
            imageName: "category_tops",
            items: [
                PackingItem(id: "sweater", name: "Warm Sweater", description: "For cooler evenings", isRecommended: true, imageName: "item_sweater"),
                PackingItem(id: "tshirt", name: "T-Shirts", description: "3-4 pieces", isRecommended: true, imageName: "item_tshirt"),
                PackingItem(id: "blouse", name: "Light Blouse", description: "Versatile layering", isRecommended: false, imageName: "item_blouse")
            ]
        ),
        PackingCategory(
            id: "bottoms",
            name: "Bottoms",
            itemCount: 4,
            description: "Pants & skirts",
            imageName: "category_bottoms",
            items: [
                PackingItem(id: "jeans", name: "Jeans", description: "1-2 pairs", isRecommended: true, imageName: "item_jeans"),
                PackingItem(id: "pants", name: "Dress Pants", description: "For nicer occasions", isRecommended: false, imageName: "item_pants")
            ]
        ),
        PackingCategory(
            id: "underwear",
            name: "Underwear & Sleep",
            itemCount: 7,
            description: "Comfortable basics",
            imageName: "category_underwear",
            items: [
                PackingItem(id: "underwear", name: "Underwear", description: "7-8 pieces", isRecommended: true, imageName: "item_underwear"),
                PackingItem(id: "pajamas", name: "Pajamas", description: "Comfortable sleepwear", isRecommended: true, imageName: "item_pajamas")
            ]
        ),
        PackingCategory(
            id: "outers",
            name: "Outers",
            itemCount: 3,
            description: "Warmth & weather protection",
            imageName: "category_outers",
            items: [
                PackingItem(id: "jacket", name: "Winter Jacket", description: "For cold weather", isRecommended: true, imageName: "item_jacket"),
                PackingItem(id: "raincoat", name: "Light Rain Jacket", description: "Just in case", isRecommended: false, imageName: "item_raincoat")
            ]
        ),
        PackingCategory(
            id: "nonclothes",
            name: "Non-clothes",
            itemCount: 12,
            description: "Toiletries, tech, extras",
            imageName: "category_nonclothes",
            items: [
                PackingItem(id: "toiletries", name: "Toiletries", description: "Travel-sized essentials", isRecommended: true, imageName: "item_toiletries"),
                PackingItem(id: "phone_charger", name: "Phone Charger", description: "Don't forget!", isRecommended: true, imageName: "item_charger")
            ]
        ),
        PackingCategory(
            id: "adapters",
            name: "Adapters & Essentials",
            itemCount: 2,
            description: "Japan uses Type A plugs",
            imageName: "category_adapters",
            items: [
                PackingItem(id: "adapter", name: "Power Adapter", description: "Type A for Japan", isRecommended: true, imageName: "item_adapter"),
                PackingItem(id: "converter", name: "Voltage Converter", description: "If needed", isRecommended: false, imageName: "item_converter")
            ]
        )
    ]
}

extension PackingListData {
    static let sample = PackingListData(
        destination: Destination.samples[0], // Tokyo
        luggageRecommendation: LuggageRecommendation(
            type: "Medium Luggage",
            reason: "Best balance for 7 nights with layers",
            imageName: "luggage_medium"
        ),
        categories: PackingCategory.samples,
        tip: "You have laundry access, so packing fewer pieces is totally fine."
    )
}