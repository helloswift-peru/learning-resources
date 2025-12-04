import Foundation

struct UpdateCartItemQuantityUseCase {
    private let cartRepository: CartRepository

    init(cartRepository: CartRepository) {
        self.cartRepository = cartRepository
    }

    func execute(id: UUID, quantity: Int) async throws {
        try await cartRepository.updateQuantity(for: id, quantity: quantity)
    }
}