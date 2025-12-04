import Foundation

actor CartRepositoryImpl: CartRepository {
    private var items: [CartItem] = []

    func getCartItems() async -> [CartItem] {
        items
    }

    func addItem(_ item: CartItem) async {
        if let index = items.firstIndex(where: { $0.product.id == item.product.id }) {
            items[index].quantity += item.quantity
        } else {
            items.append(item)
        }
    }

    func removeItem(with id: UUID) async {
        items.removeAll { $0.id == id }
    }

    func updateQuantity(for id: UUID, quantity: Int) async throws {
        guard let index = items.firstIndex(where: { $0.id == id }) else {
            throw CartError.itemNotFound
        }
        if quantity <= 0 {
            items.remove(at: index)
        } else {
            items[index].quantity = quantity
        }
    }
}

enum CartError: Error {
    case itemNotFound
}