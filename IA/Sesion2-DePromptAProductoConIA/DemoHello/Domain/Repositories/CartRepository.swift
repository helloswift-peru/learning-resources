import Foundation

protocol CartRepository {
    func getCartItems() async -> [CartItem]
    func addItem(_ item: CartItem) async
    func removeItem(with id: UUID) async
    func updateQuantity(for id: UUID, quantity: Int) async throws
}