import Foundation

struct GetCartItemsUseCase {
    private let cartRepository: CartRepository

    init(cartRepository: CartRepository) {
        self.cartRepository = cartRepository
    }

    func execute() async -> [CartItem] {
        await cartRepository.getCartItems()
    }
}