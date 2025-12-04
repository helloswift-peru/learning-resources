import Foundation

struct Product: Identifiable {
    let id: UUID
    let name: String
    let price: Double
    let imageName: String

    init(id: UUID = UUID(), name: String, price: Double, imageName: String) {
        self.id = id
        self.name = name
        self.price = price
        self.imageName = imageName
    }
}